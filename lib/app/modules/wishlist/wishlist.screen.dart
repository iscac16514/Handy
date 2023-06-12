// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handy/app/controllers/wishlist_controller.dart';
import 'package:handy/app/routes/app_pages.dart';
import 'package:handy/app/shared/theme.dart';
import 'package:handy/app/widgets/wishlist_card.dart';

class WishlistScreen extends GetView<WishlistController> {
  WishlistScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(WishlistController());
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: background1Color,
        centerTitle: true,
        title: Text(
          'Favoritos',
          style: primaryTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyWishlist() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: background3Color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon_wishlist_info.png',
                width: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sem produtos favoritos',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'Procure produtos e adicione-os aos favoritos',
                style: subtitleTextStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 44,
                child: TextButton(
                  onPressed: () => Get.offAndToNamed(Routes.MAIN),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        12,
                      ),
                    ),
                  ),
                  child: Text(
                    'Explorar loja',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          color: background3Color,
          child: Obx(
            () => ListView(
              padding: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              children: controller.wishList.value
                  .map((product) => WishlistCard(product: product))
                  .toList(),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        Obx(
          () => controller.wishList.value.isEmpty ? emptyWishlist() : content(),
        ),
      ],
    );
  }
}
