// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handy/app/shared/state.dart';
import 'package:handy/app/shared/theme.dart';
import 'package:handy/app/widgets/product_card.dart';
import 'package:handy/app/widgets/product_tile.dart';
import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá ${controller.user.name ?? ''}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '@${controller.user.username ?? ''}',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(controller.user.profilePhotoUrl ?? ''),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget title({required String title}) {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          title,
          style: primaryTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget popularProduct() {
      return Container(
        margin: const EdgeInsets.only(top: 14),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Obx(
            () => Row(
              children: [
                SizedBox(
                  width: defaultMargin,
                ),
                Row(
                  children: controller.listProducts.value
                      .map((product) => ProductCard(
                            product: product,
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: const EdgeInsets.only(
          top: 14,
        ),
        child: Obx(
          () => Column(
            children: controller.listProducts.value
                .map((product) => ProductTile(product: product))
                .toList(),
          ),
        ),
      );
    }

    return controller.dataState.value == DataState.loading
        ? Center(
            child: CircularProgressIndicator(
              color: primaryTextColor,
              strokeWidth: 2,
            ),
          )
        : ListView(
            children: [
              header(),
              title(title: 'Produtos populares'),
              popularProduct(),
              title(title: 'Veja mais'),
              newArrivals(),
            ],
          );
  }
}
