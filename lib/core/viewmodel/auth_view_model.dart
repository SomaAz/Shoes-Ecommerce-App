import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shoes_ecommerce_app/core/service/firestore_service.dart';
import 'package:shoes_ecommerce_app/model/user_model.dart';

class AuthViewModel extends GetxController {
  final _firebaseAuth = FirebaseAuth.instance;
  bool _showPassword = false;
  String? email, password, name;
  String _page = "l";
  String get page => _page;
  // ignore: prefer_final_fields
  Rx<User?> _user = Rx<User?>(null);

  User? get user => _user.value;
  bool get showPassword => _showPassword;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  //hello123
  void signup() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      )
          .then(
        (userData) {
          FirestoreService().addUserToFirestore(
            UserModel(
              name: name!,
              uid: userData.user!.uid,
              email: email!,
              image: "",
            ),
          );
          update();
        },
      );
    } on FirebaseAuthException catch (e) {
      await Get.defaultDialog(
        title: "Error Signing up",
        middleText: _getErrorMessageOfException(e),
        textConfirm: "Ok",
        onConfirm: () {
          Get.back();
        },
      );
      print(e);
    }
  }

  void login() async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      update();
    } on FirebaseAuthException catch (e) {
      await Get.defaultDialog(
        title: "Error logging in",
        middleText: _getErrorMessageOfException(e),
        textConfirm: "Ok",
        onConfirm: () {
          Get.back();
        },
      );
      print(e);
    }
  }

  void logout() {
    _firebaseAuth.signOut();
    update();
  }

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    update();
  }

  void togglePage() {
    _page = _page == "l" ? "s" : "l";
    update();
  }

  String _getErrorMessageOfException(FirebaseAuthException error) {
    var errorMessage = "";
    switch (error.code.toUpperCase().replaceAll("-", "_")) {
      case "INVALID_EMAIL":
        errorMessage = "Your email address is Invalid.";
        break;
      case "WRONG_PASSWORD":
        errorMessage = "Your password is wrong.";
        break;
      case "USER_NOT_FOUND":
        errorMessage = "User with this email doesn't exist.";
        break;
      case "USER_DISABLED":
        errorMessage = "User with this email has been disabled.";
        break;
      case "TOO_MANY_REQUESTS":
        errorMessage = "Too many requests. Try again later.";
        break;
      case "OPERATION_NOT_ALLOWED":
        errorMessage = "Signing in with Email and Password is not enabled.";
        break;
      default:
        errorMessage = "There is an error happend logging in";
    }
    print(error.code);
    return errorMessage;
  }
}
