import 'package:get/get.dart';
import 'package:fakenex/core/services/navigation_service.dart';
import 'package:fakenex/view/1_home/home_screen.dart';

class LoginController extends GetxController {
  var isPasswordVisible = false.obs;
  var rememberMe = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    rememberMe.value = value ?? false;
  }

  void loginAndNavigate() {
    NavigationService.pushReplacement(const HomeScreen());
  }
}