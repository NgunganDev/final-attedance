import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  final String userName;
  final String timeStamp;
  final String message;
  const ChatTile({super.key, required this.message, required this.timeStamp, required this.userName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.width * 0.12,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(userName, style: TextStyle(
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w500
              ),),
            ],
          ),
          Text(message, style: TextStyle(
            fontSize: size.height * 0.012,
            fontWeight: FontWeight.w400
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(timeStamp, style: TextStyle(
                fontSize: size.height * 0.012,
                fontWeight: FontWeight.w400
              ),)
            ],
            ),
        ],
      ),
    );
  }
}