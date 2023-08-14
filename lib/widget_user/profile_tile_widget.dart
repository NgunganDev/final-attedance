import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData ic;
  const ProfileTile(
      {super.key, required this.ic, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * 0.85,
      height: size.height * 0.1,
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.01, horizontal: size.width * 0.03),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.baseline,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(ic, size: size.height * 0.05, weight: 0.2, color: Colors.grey),
          SizedBox(
            width: size.width * 0.05,
          ),
          Container(
            padding: EdgeInsets.only(
              bottom: size.height * 0.01
            ),
            height: size.height * 0.09,
            width: size.width * 0.6,
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: size.height * 0.022,
                    fontWeight: FontWeight.w400,
                    // color: Colors.grey
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
