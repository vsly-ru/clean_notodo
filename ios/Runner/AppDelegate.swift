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
        let deviceChannel = FlutterMethodChannel(name: "notodo.flutter.methodchannel/iOS",
                                                 binaryMessenger: controller.binaryMessenger);
        // handle method channel logic
        self.handleMethodHandler(deviceChannel: deviceChannel);
        
        // firebase
        FirebaseApp.configure();
        
        // Flutter app
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func reply(result: @escaping FlutterResult, isSuccess: Bool, message: String, data:Any) {
        result(["isSuccess": isSuccess,
                "message":message,
                "data":data])
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
                            }
                        } else {
                            print("User signs up successfully")
                            let newUserInfo = Auth.auth().currentUser
                            let email = newUserInfo?.email
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
                self.reply(result:result, isSuccess: true, data: "test")
                return
            }
            // if nothing matched the method name
            result(FlutterMethodNotImplemented)
            
        })
    }
}
