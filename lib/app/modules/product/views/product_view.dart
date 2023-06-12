import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handy/app/controllers/wishlist_controller.dart';
import 'package:handy/app/modules/cart/controllers/cart_controller.dart';
import 'package:handy/app/routes/app_pages.dart';
import 'package:handy/app/shared/theme.dart';

import '../controllers/product_controller.dart';

class ProductView extends GetView<ProductController> {
  ProductView({Key? key}) : super(key: key);

  final wishlistController = Get.put(WishlistController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (context) => SizedBox(
          width: MediaQuery.of(context).size.width - (2 * defaultMargin),
          child: AlertDialog(
            backgroundColor: background3Color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icon_success_info.png',
                    width: 100,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Sucesso',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Produto adicionado ao carrinho',
                    style: secondaryTextStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.CART),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: primaryColor),
                    child: Text(
                      'Ver carrinho',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Obx(
        () => Container(
          width: controller.currentIndex.value == index ? 16 : 4,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: controller.currentIndex.value == index
                ? primaryColor
                : const Color(0xffC4C4C4),
          ),
        ),
      );
    }

    Widget familiarProductsCard(String imageUrl) {
      return Container(
        width: 54,
        height: 54,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          image: DecorationImage(
            image: AssetImage(imageUrl),
          ),
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 17),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
              color: background1Color,
            ),
        child: Column(
          children: [
            // Header
            Container(
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.product.value.name.toString(),
                          style: primaryTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                        ),
                        Text(
                          controller.product.value.category!.name.toString(),
                          style: secondaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistController.setProduct(controller.product.value);
                      if (wishlistController
                          .isWishlist(controller.product.value)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: secondaryColor,
                            content: const Text(
                              'Produto adicionado aos favoritos',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: alertColor,
                            content: const Text(
                              'Produto removido dos favoritos',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }
                    },
                    child: Obx(
                      () => wishlistController
                              .isWishlist(controller.product.value)
                          ? Image.asset(
                              'assets/icon_wishlist_full.png',
                              width: 46,
                            )
                          : Image.asset(
                              'assets/icon_wishlist.png',
                              width: 46,
                            ),
                    ),
                  ),
                ],
              ),
            ),

            // Price
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              decoration: BoxDecoration(
                color: background2Color,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Desde',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '€${controller.product.value.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),

            // Descrição

            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Descrição',
                    style: primaryTextStyle.copyWith(fontWeight: bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '${controller.product.value.description}',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                    ),
                    textAlign: TextAlign.justify,
                  )
                ],
              ),
            ),

            // Produtos relacionados
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Produtos relacionados',
                      style: primaryTextStyle.copyWith(fontWeight: medium),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: controller.familiarProducts.map((image) {
                        controller.indexFamiliar++;
                        return Container(
                          margin: EdgeInsets.only(
                              left: controller.indexFamiliar == 0
                                  ? defaultMargin
                                  : 0),
                          child: familiarProductsCard(image),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),

            // Buttons

            Container(
              margin: EdgeInsets.all(defaultMargin),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.CHATPAGE,
                        arguments: controller.product.value),
                    child: Container(
                      width: 54,
                      height: 54,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/button_chat.png'),
                      )),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: TextButton(
                        onPressed: () {
                          cartController.addCart(controller.product.value);
                          showSuccessDialog();
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            backgroundColor: primaryColor),
                        child: Text(
                          'Adicionar ao carrinho',
                          style: primaryTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
          ),
        ),
      );
    }

    Widget header() {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 40,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.chevron_left_outlined),
                ),
                IconButton(
                  onPressed: () => Get.toNamed(Routes.CART),
                  icon: Icon(
                    Icons.shopping_bag,
                    color: background1Color,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: controller.product.value.galleries!
                .map((image) => Image.network(
                      image.url!,
                      //width: MediaQuery.of(context).size.width,
                      //height: 310,
                      //fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) => controller.currentIndex(index),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.images.map(
              (e) {
                controller.index++;
                return indicator(controller.index);
              },
            ).toList(),
          ),
        ],
      );
    }



      return Scaffold(
      backgroundColor: background6Color,
      body: Column(
        children: [
          header(),
          Expanded(child: content()),
        ],
      ),
    );
  }
}
