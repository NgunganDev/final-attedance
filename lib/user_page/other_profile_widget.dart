import 'package:attedancebeta/color/color_const.dart';
import 'package:flutter/material.dart';

class OtherProfileWidget extends StatelessWidget {
  final String name;
  final String type;
  final String bio;
  final String email;
  final String imageUrl;
  const OtherProfileWidget({super.key, required this.name, required this.bio, required this.type, required this.imageUrl, required this.email});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Column(
          children: [
            Container(
              color: ColorUse.mainBg,
              width: size.width,
              height: size.height * 0.2,
            ),
            Container(
              color: ColorUse.colorText,
              width: size.width,
              height: size.height * 0.8,
            ),
          ],
        ),
        Positioned(
          top: size.height * 0.12,
          // left: size.width / 4,
          child: Container(
            width: size.width,
            height: size.height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: ColorUse.colorBf,
                  backgroundImage: NetworkImage(imageUrl),
                  radius: size.height * 0.08,
                ),
                Text(email, style: TextStyle(
                  fontSize: size.height * 0.02,
                  fontWeight: FontWeight.w500
                ),),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.02,
                    horizontal: size.width * 0.02
                  ),
                  width: size.width,
                  height: size.height * 0.22,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.s,
                    children: [
                       Container(
                        width: size.width * 0.8,
                        height: size.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(name, style: TextStyle(fontSize: size.height * 0.02, fontWeight: FontWeight.w500),),
                           const Icon(Icons.person_2_outlined),
                          ],
                        )),
                      Container(
                        width: size.width * 0.8,
                        height: size.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(bio, style: TextStyle(fontSize: size.height * 0.02, fontWeight: FontWeight.w500),),
                              const Icon(Icons.menu),
                          ],
                        )),
                      Container(
                        width: size.width * 0.8,
                        height: size.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(type, style: TextStyle(fontSize: size.height * 0.02, fontWeight: FontWeight.w500, fontStyle: FontStyle.italic, color: Colors.grey),),
                              const Icon(Icons.merge_type),
                          ],
                        ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}