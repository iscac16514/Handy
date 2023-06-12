import 'package:get/get.dart';
import 'package:handy/app/data/models/history_model.dart';

class DetailHistoriesController extends GetxController {
  //TODO: Implement DetailHistoriesController
  final count = 0.obs;
  Rx<HistoryModel> history = HistoryModel().obs;
  @override
  void onInit() {
    super.onInit();
    history(Get.arguments);
  }
}
