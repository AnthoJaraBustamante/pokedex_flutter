import 'package:get/get.dart';
import 'package:pokedex_flutter/app/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    goToHome();
  }

  void goToHome() {
    Future<void>.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routes.home);
    });
  }
}
