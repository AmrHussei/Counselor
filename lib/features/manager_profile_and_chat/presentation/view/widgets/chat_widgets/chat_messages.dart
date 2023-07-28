import 'package:flutter/material.dart';
import 'package:legal_advice_app/features/manager_profile_and_chat/presentation/view/screens/chat_screen.dart';
import 'package:legal_advice_app/features/manager_profile_and_chat/presentation/view/widgets/chat_widgets/message_tile.dart';
import '../../../../../../core/utils/constant.dart';

chatMessages() {
  return Expanded(
    child: ListView.builder(
      controller: scrollController,
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageTile(
          message: messages.isEmpty ? null : messages[index].message,
          sender:
              messages[index].sender == UserDataConstant.id ? 'انا' : 'المحامي',
          sentByMe: messages[index].sender == UserDataConstant.id,
        );
      },
    ),
  );
}
