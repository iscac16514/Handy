import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handy/app/modules/cart/controllers/cart_controller.dart';
import 'package:handy/app/modules/chat/chat.screen.dart';
import 'package:handy/app/modules/home/home.screen.dart';
import 'package:handy/app/modules/profile/profile.screen.dart';
import 'package:handy/app/modules/wishlist/wishlist.screen.dart';
import 'package:handy/app/routes/app_pages.dart';

import 'package:handy/app/shared/theme.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  MainView({Key? key}) : super(key: key);
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    Widget cartButton() {
      return FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CART),
        backgroundColor: blueColor,
        child: Image.asset(
          'assets/icon_cart.png',
          width: 20,
        ),
      );
    }

    Widget customBottomNav() {
      return ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 12,
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          child: Obx(
            () => BottomNavigationBar(
              elevation: 0,
              backgroundColor: background4Color,
              currentIndex: controller.currentIndex.value,
              onTap: (value) {
                controller.currentIndex(value);
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_home.png',
                      width: 21,
                      color: controller.currentIndex.value == 0
                          ? blueColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_message.png',
                      width: 20,
                      color: controller.currentIndex.value == 1
                          ? blueColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_favorite.png',
                      width: 20,
                      color: controller.currentIndex.value == 2
                          ? blueColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    child: Image.asset(
                      'assets/icon_profile.png',
                      width: 20,
                      color: controller.currentIndex.value == 3
                          ? blueColor
                          : const Color(0xff808191),
                    ),
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget body() {
      switch (controller.currentIndex.value) {
        case 0:
          return HomeScreen();
        case 1:
          return ChatScreen();
        case 2:
          return WishlistScreen();
        case 3:
          return ProfileScreen();
        default:
          return Container();
      }
    }

    return Scaffold(
      backgroundColor: controller.currentIndex.value == 0
          ? background1Color
          : background3Color,
      body: Obx(() => body()),
      floatingActionButton: cartButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: customBottomNav(),
    );
  }
}
