import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  var emailError = false;
  TextEditingController passwordController = TextEditingController();
  var passwordError = false;

  var secureText = true;
  var userLoggedIn = false;
  var loginError = false;
  var loading = false;

  changePassVisibility() {
    secureText = !secureText;
    notifyListeners();
  }

  setEmailError(err) {
    emailError = err;
    notifyListeners();
  }

  setPasswordError(err) {
    passwordError = err;
    notifyListeners();
  }

  setLoading(status) {
    loading = status;
    notifyListeners();
  }

  loginUser() {
    if (emailController.text.isEmpty) {
      setEmailError(true);
    } else if (passwordController.text.isEmpty) {
      setPasswordError(true);
    } else if (emailController.text == "mohdsalmanp866@gmail.com" &&
        passwordController.text == "Salman@123") {
      setLoading(true);
      setEmailError(false);
      setPasswordError(false);

      Get.snackbar("Success", "Login successful!");
      // userLoggedIn = true;
      Future.delayed(const Duration(seconds: 5)).then((value) {
        setLoading(false);
        Get.closeAllSnackbars();
        Get.offAndToNamed('/dashboardScreen');
      });
    } else {
      setEmailError(true);
      setPasswordError(true);
      setLoading(false);
      loginError = true;
    }
  }
}
