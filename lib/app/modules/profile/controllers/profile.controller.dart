import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:handy/app/data/api/auth_services.dart';
import 'package:handy/app/data/models/user_model.dart';
import 'package:handy/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  late UserModel user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDataUser();
  }

  logout() async {
    final data = await AuthServices().logout();
    if (data) {
      Get.snackbar('Sucesso', 'Sessão terminada com sucesso');
      Get.offAndToNamed(Routes.SIGN_IN);
    } else {
      Get.snackbar('Erro', 'Não foi possível terminar sessão');
    }
  }

  getDataUser() {
    final box = GetStorage();
    final data = box.read('user');
    user = UserModel();
    user = UserModel.fromJson(data);
  }
}
