import 'package:attedancebeta/color/color_const.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  const UserTile({super.key,
  required this.name,
  required this.email,
  required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * 0.9,
      height: size.height * 0.12,
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: ColorUse.colorBf,
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(name, style: TextStyle(
          fontSize: size.height * 0.022,
          fontWeight: FontWeight.w500
        ),),
        subtitle: Text(email),
      ),
    );
  }
}