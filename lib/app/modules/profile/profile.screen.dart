import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handy/app/routes/app_pages.dart';
import 'package:handy/app/shared/theme.dart';

import 'controllers/profile.controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: background1Color,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.all(defaultMargin),
            child: Row(
              children: [
                ClipOval(
                  child: Image.network(
                    controller.user.profilePhotoUrl.toString() ?? '',
                    width: 64,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá ${controller.user.name}',
                        style: primaryTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                      ),
                      Text(
                        '@${controller.user.username}',
                        style: subtitleTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => controller.logout(),
                  child: Image.asset(
                    'assets/icon_exit.png',
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget menuItem(String text) {
      return Container(
        margin: const EdgeInsets.only(top: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: secondaryTextStyle.copyWith(fontSize: 13),
            ),
            Icon(
              Icons.chevron_right,
              color: primaryTextColor,
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          decoration: BoxDecoration(
            color: background3Color,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Conta',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.EDITPROFILE),
                child: menuItem(
                  'Editar Perfil',
                ),
              ),
              InkWell(
                onTap: () => Get.toNamed(Routes.HISTORIES),
                child: menuItem('Os seus pedidos'),
              ),
              menuItem('Ajuda'),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Outras configurações',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              menuItem('Política de privacidade'),
              menuItem('Termos de utilização'),
              menuItem('Acerca da aplicação'),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
