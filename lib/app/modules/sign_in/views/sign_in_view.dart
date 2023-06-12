import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handy/app/routes/app_pages.dart';
import 'package:handy/app/shared/theme.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Iniciar sessão',
              style:
                  secondaryTextStyle.copyWith(fontSize: 30, fontWeight: bold),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Por favor inicie sessão na sua conta',
              style: secondaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
  return Container(
    margin: const EdgeInsets.only(top: 70),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Endereço de e-mail',
          style: purpleTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: handybackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: primaryColor,  // Outline
              width: 1,
            ),
          ),
          child: Center(
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_email.png',
                  width: 17,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.emailC,
                    style: blackTextStyle,
                    decoration: InputDecoration.collapsed(
                      hintText: 'O seu endereço de e-mail',
                      hintStyle: secondaryTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget passwordInput() {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Palavra-passe',
          style: purpleTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: handybackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: primaryColor,  // Outline
              width: 1,
            ),
          ),
          child: Center(
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_password.png',
                  width: 17,
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: controller.passwordC,
                    style: blackTextStyle,
                    obscureText: true,
                    decoration: InputDecoration.collapsed(
                      hintText: 'A sua palavra-passe',
                      hintStyle: secondaryTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () => controller.login(),
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Obx(
            () => controller.isLoading.value == true
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: primaryTextColor,
                          strokeWidth: 2,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'A carregar',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  )
                : Text(
                    'Iniciar sessão',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ainda não tem conta? ',
              style: subtitleTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.SIGN_UP),
              child: Text(
                'Novo registo',
                style: purpleTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: bold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: handybackground,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              emailInput(),
              passwordInput(),
              signInButton(),
              const Spacer(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }
}
