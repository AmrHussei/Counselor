import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_form_for_chat_and_comment.dart';
import '../widgets/chat_widgets/message.dart';
import '../widgets/chat_widgets/message_tile.dart';

IO.Socket? socket;
List<Message> messages = [];
ScrollController scrollController = ScrollController();

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    initSocket();
    super.initState();
  }

  initSocket() {
    socket!.on('myMessage', (data) {
      setState(() {
        print('+++++++++++++++++++++++++++ data  ++++++++++++++++++++++++');
        print(data);
        final newdata = Message.fromJson(data);
        messages.add(newdata);
        scrollController.animateTo(
          scrollController.position.maxScrollExtent + 90.h,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });

      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          chatMessages(),
          TextFormForChatAndComment(
            messageController: messageController,
            buttonText: 'ارسال',
            hintText: 'اكتب رسالتك',
            onTap: () {
              socket!.emit('message', {
                "sender": UserDataConstant.id, //id of user
                "recipient": "643b4b51f270c6d03747aff0", // the manager
                "message": messageController.text
              });
              messageController.clear();
            },
          )
        ],
      ),
    );
  }

  chatMessages() {
    return Expanded(
      child: ListView.builder(
        controller: scrollController,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return MessageTile(
            message: messages.isEmpty ? null : messages[index].message,
            sender: messages[index].sender == UserDataConstant.id
                ? 'انا'
                : 'المحامي',
            sentByMe: messages[index].sender == UserDataConstant.id,
          );
        },
      ),
    );
  }
}
