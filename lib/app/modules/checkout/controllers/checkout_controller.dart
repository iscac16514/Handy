import 'package:get/get.dart';
import 'package:handy/app/data/api/transaction_services.dart';
import 'package:handy/app/data/models/cart_model.dart';
import 'package:handy/app/routes/app_pages.dart';
import 'package:handy/app/shared/state.dart';

class CheckoutController extends GetxController {
  final dataState = DataState.loading.obs;

  postCheckout(List<CartModel> carts, double totalPrice) async {
    final checkout = await TransactionServices().checkout(carts, totalPrice);
    print(checkout);
    if (checkout == true) {
      Get.snackbar('Successo', 'Pedido realizado com sucesso');
      Get.offAndToNamed(Routes.CHECKOUT_SUCCESS);
    } else {
      Get.snackbar('Erro', 'Ocorreu um erro no seu pedido');
    }
  }

  changeState(DataState state) {
    dataState(state);
  }
}
