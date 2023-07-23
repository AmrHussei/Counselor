import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_advice_app/core/utils/assets_data.dart';
import 'package:legal_advice_app/core/widgets/auth_text_form_filed.dart';
import 'package:legal_advice_app/core/widgets/text_utils.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../../../core/utils/constant.dart';
import '../../../../../core/widgets/text_form_for_chat_and_comment.dart';

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
    print('before connecrt ---------------------------');
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

class MessageTile extends StatefulWidget {
  final String? message;
  final String sender;
  final bool sentByMe;

  const MessageTile(
      {Key? key,
      required this.message,
      required this.sender,
      required this.sentByMe})
      : super(key: key);

  @override
  State<MessageTile> createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {
  @override
  Widget build(BuildContext context) {
    if (widget.message == null) {
      return SizedBox();
    } else {
      return Container(
        padding: EdgeInsets.only(
            top: 4.h,
            bottom: 4.h,
            left: widget.sentByMe ? 0 : 20.w,
            right: widget.sentByMe ? 20.w : 0),
        alignment:
            widget.sentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: widget.sentByMe
              ? EdgeInsets.only(left: 10.w)
              : EdgeInsets.only(right: 10.w),
          padding:
              EdgeInsets.only(top: 10.h, bottom: 10, left: 15.w, right: 15.w),
          decoration: BoxDecoration(
              borderRadius: widget.sentByMe
                  ? BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp),
                      bottomLeft: Radius.circular(15.sp),
                    )
                  : BorderRadius.only(
                      topLeft: Radius.circular(15.sp),
                      topRight: Radius.circular(15.sp),
                      bottomRight: Radius.circular(15.sp),
                    ),
              color: widget.sentByMe
                  ? Theme.of(context).primaryColor
                  : Colors.grey[700]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.sender.toUpperCase(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -0.5),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                widget.message!,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              )
            ],
          ),
        ),
      );
    }
  }
}

class Message {
  String sender;
  String recipient;
  String message;

  Message(
      {required this.sender, required this.recipient, required this.message});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'],
      recipient: json['recipient'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() => {
        'sender': sender,
        'recipient': recipient,
        'message': message,
      };
}
