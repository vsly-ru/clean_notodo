import UIKit
import Flutter
import Firebase
import FirebaseAuth


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // get flutter view controller
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController;
        // get device channel
        let deviceChannel = FlutterMethodChannel(name: "notodo.flutter.methodchannel",
                                                 binaryMessenger: controller.binaryMessenger);
        
        // firebase init
        FirebaseApp.configure();
        
        // handle method channel logic
        self.handleMethodHandler(deviceChannel: deviceChannel);
        
        
        // Flutter app
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func reply(result: @escaping FlutterResult, isSuccess: Bool, message: String, data:Any) {
        result(["isSuccess": isSuccess,
                "message":message,
                "data":data])
    }
    
    
    private func convertUser(user: User) -> Dictionary<String,String?> {
        var re = Dictionary<String,String?>();
        re["email"] = user.email;
        re["name"] = user.displayName;
        re["uid"] = user.uid;
        re["profilePictureUrl"] = user.photoURL?.absoluteString;
        return re
    }

    
    private func handleMethodHandler(deviceChannel: FlutterMethodChannel) {
        deviceChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
            
            if call.method == "signup" {
                if let args = call.arguments as? Dictionary<String, Any>,
                   let email = args["email"] as? String,
                   let password = args["password"] as? String {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let error = error as? NSError {
                            switch AuthErrorCode(rawValue: error.code) {
                            case .operationNotAllowed:
                                result(FlutterError.init(code: "operationNotAllowed", message: nil, details: nil))
                                return
                            case .emailAlreadyInUse:
                                result(FlutterError.init(code: "emailAlreadyInUse", message: nil, details: nil))
                                return
                            case .invalidEmail:
                                result(FlutterError.init(code: "invalidEmail", message: nil, details: nil))
                                return
                            case .weakPassword:
                                result(FlutterError.init(code: "weakPassword", message: nil, details: nil))
                                return
                            default:
                                print("Error: \(error.localizedDescription)")
                                result(FlutterError.init(code: "authError", message: "Error: \(error.localizedDescription)", details: nil))
                                return
                            }
                        } else {
                            let newUserInfo = Auth.auth().currentUser
                            let email = newUserInfo?.email
                            self.reply(result: result, isSuccess: true, message: "success", data: self.convertUser(user: newUserInfo!))
                        }
                    }
                } else {
                    result(FlutterError.init(code: "wrong_args", message: nil, details: nil))
                }
                return
            }
            
            if call.method == "signin" {
                if let args = call.arguments as? Dictionary<String, Any>,
                   let email = args["email"] as? String,
                   let password = args["password"] as? String {
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let error = error as? NSError {
                            switch AuthErrorCode(rawValue: error.code) {
                            case .operationNotAllowed:
                                result(FlutterError.init(code: "operationNotAllowed", message: nil, details: nil))
                                return
                            case .wrongPassword:
                                result(FlutterError.init(code: "wrongPassword", message: nil, details: nil))
                                return
                            case .invalidEmail:
                                result(FlutterError.init(code: "invalidEmail", message: nil, details: nil))
                                return
                            case .missingEmail:
                                result(FlutterError.init(code: "missingEmail", message: nil, details: nil))
                                return
                            default:
                                print("Error: \(error.localizedDescription)")
                                result(FlutterError.init(code: "authError", message: "Error: \(error.localizedDescription)", details: nil))
                                return
                            }
                        } else {
                            let newUserInfo = Auth.auth().currentUser
                            let email = newUserInfo?.email
                            self.reply(result: result, isSuccess: true, message: "success", data: self.convertUser(user: newUserInfo!))
                        }
                    }
                } else {
                    result(FlutterError.init(code: "wrong_args", message: nil, details: nil))
                }
                return
            }
            
            let db = Firestore.firestore()
            
            if call.method == "set_doc" {
                if let args = call.arguments as? Dictionary<String, Any>,
                   let collection = args["collection"] as? String,
                   let id = args["id"] as? String,
                   let doc = args["doc"] as? Dictionary<String, Any>
                {
                    db.collection(collection).document(id).setData(doc)
                    { err in
                        if let err = err {
                            result(FlutterError.init(code: "set_doc_failed", message: nil, details: nil))
                        } else {
                            self.reply(result: result, isSuccess: true, message: "ok", data: doc)
                        }
                    }
                } else {
                    result(FlutterError.init(code: "wrong_args", message: nil, details: nil))
                }
                return
            }
            
            if call.method == "get_doc" {
                if let args = call.arguments as? Dictionary<String, Any>,
                   let collection = args["collection"] as? String,
                   let id = args["id"] as? String
                {
                    db.collection(collection).document(id).getDocument
                    { (document, error) in
                        if let document = document, document.exists {
                            var _doc = document.data();
                            _doc!["id"] = document.documentID;
                            self.reply(result: result, isSuccess: true, message: "ok", data: _doc)
                        } else {
                            result(FlutterError.init(code: "not_found", message: nil, details: nil))
                        }
                    }
                } else {
                    result(FlutterError.init(code: "wrong_args", message: nil, details: nil))
                }
                return
            }
            
            if call.method == "get_docs" {
                if let args = call.arguments as? Dictionary<String, Any>,
                   let collection = args["collection"] as? String,
                   let field = args["field"] as? String,
                   let uid = args["uid"] as? String
                {
                    db.collection(collection).whereField(field, isEqualTo: uid).getDocuments() { (querySnapshot, err) in
                        if let err = err {
                            result(FlutterError.init(code: "query_failed", message: err.localizedDescription, details: nil))
                        } else {
                            var documents = [] as Array<Dictionary<String,Any>>;
                            for doc in querySnapshot!.documents {
                                var _doc = doc.data();
                                _doc["id"] = doc.documentID;
                                documents.append(_doc);
                            }
                            self.reply(result: result, isSuccess: true, message: "ok", data: documents)
                        }
                    }
                } else {
                    result(FlutterError.init(code: "wrong_args", message: nil, details: nil))
                }
                return
            }
            
            if call.method == "ping" {
                result("pong");
                return
            }
            if call.method == "test" {
                self.reply(result:result, isSuccess: true, message: "", data: "test")
                return
            }
            // if nothing matched the method name
            result(FlutterMethodNotImplemented)
            
        })
    }
    }
