import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
