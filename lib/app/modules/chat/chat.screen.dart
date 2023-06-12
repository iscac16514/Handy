import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handy/app/data/api/message_services.dart';
import 'package:handy/app/data/models/message_model.dart';
import 'package:handy/app/shared/theme.dart';
import 'package:handy/app/widgets/chat_tile.dart';

import 'controllers/chat.controller.dart';

class ChatScreen extends GetView<ChatController> {
  ChatScreen({Key? key}) : super(key: key);
  @override
  final controller = Get.put(ChatController());
  Widget header() {
    return AppBar(
      backgroundColor: background1Color,
      centerTitle: true,
      title: Text(
        'Mensagens',
        style: primaryTextStyle.copyWith(
          fontSize: 18,
          fontWeight: medium,
        ),
      ),
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }

  Widget emptyChat() {
    return Expanded(
      child: Container(
        width: double.infinity,
        color: background3Color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_message_info.png',
              width: 80,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Sem mensagens',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              'Ainda não iniciou nenhuma conversa com vendedores',
              style: subtitleTextStyle,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget content() {
    return StreamBuilder<List<MessageModel>>(
        stream: MessageService().getMessageByUserId(
          userId: controller.user.id!,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return emptyChat();
            }
            return Expanded(
              child: Container(
                width: double.infinity,
                color: background3Color,
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                  ),
                  children: [
                    ChatTile(
                        message: snapshot.data![snapshot.data!.length - 1]),
                  ],
                ),
              ),
            );
          } else {
            return emptyChat();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        header(),
        content(),
      ],
    );
  }
}
