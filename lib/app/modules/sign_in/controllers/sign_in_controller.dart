import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:handy/app/data/api/auth_services.dart';
import 'package:handy/app/routes/app_pages.dart';

class SignInController extends GetxController {
  late TextEditingController emailC;
  late TextEditingController passwordC;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailC = TextEditingController(text: '');
    passwordC = TextEditingController(text: '');
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailC.dispose();
    passwordC.dispose();
  }

  void login() async {
    isLoading(true);
    try {
      final result = await AuthServices().login(
        email: emailC.text,
        password: passwordC.text,
      );
      final box = GetStorage();
      print(box.read('user'));
      if (result) {
        Get.toNamed(Routes.MAIN);
      } else {
        Get.snackbar('Erro', 'Verifique os seus dados');
      }
      isLoading(false);
    } catch (e) {
      Get.snackbar('Erro', e.toString());
    }
  }
}
