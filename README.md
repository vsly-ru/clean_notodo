# Nothing ToDo

Yet another (example) todo flutter project.<br>
Made using Flutter, Firebase, Clean Architecture, TDD, mockito, BLoC, freezed, dartz, get_it, injectable, go_router, flutter_hooks
<br><br>
Clean Architecture Flutter interpretation from the [Reso Coder's proposal](https://github.com/ResoCoder/flutter-tdd-clean-architecture-course):
<br><br>
<img src="https://github.com/ResoCoder/flutter-tdd-clean-architecture-course/raw/master/architecture-proposal.png" style="width: 400px;"/>

## Features

✅ Clean Architecture, TDD, mockito, BLoC in each features' presentation layer as well as appState with `go_router`'s redirections;<br>
✅ Dev/Prod runtime environment separation (using `injectable` implementation-to-interface binding);<br>
✅ Custom widgets with `flutter_hooks`<br>
✅ Firebase Auth using email/password method<br>
🔲 Cloud storage of todos<br>
✅ Firebase methods native implementation on iOS<br>
🔲 Firebase methods Dart implementation on Android and other platforms<br>

## Building

- clone `git clone https://github.com/vsly-ru/clean_notodo`
- open & get dependencies `cd clean_notodo && flutter pub get`
- (opt.) rebuild generated code `flutter packages pub run build_runner build`
- run
