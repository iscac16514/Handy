import 'package:get/get.dart';
import 'package:handy/app/data/models/product_model.dart';

class ProductController extends GetxController {
  //TODO: Implement ProductController

  List images = [
    'assets/img_1.png',
    'assets/img_1.png',
    'assets/img_1.png',
  ];
  int index = -1;
  int indexFamiliar = -1;
  RxInt currentIndex = 0.obs;

  List familiarProducts = [
    'assets/img_2.jpg',
    'assets/img_3.jpg',
    'assets/img_4.jpg',
    'assets/img_5.jpg',
    'assets/img_6.jpg',
    'assets/img_7.jpg',
  ];

  Rx<ProductModel> product = ProductModel().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    product(Get.arguments);
  }
}
