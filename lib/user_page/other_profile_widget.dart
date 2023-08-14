import 'package:attedancebeta/color/color_const.dart';
import 'package:attedancebeta/presenter/user_presenter.dart';
import 'package:attedancebeta/state/state_manage.dart';
import 'package:attedancebeta/widget_user/profile_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherProfileWidget extends ConsumerStatefulWidget {
  final String name;
  final String type;
  final String bio;
  final String email;
  final String imageUrl;
  final VoidCallback actionImg;
  const OtherProfileWidget(
      {super.key,
      required this.name,
      required this.bio,
      required this.type,
      required this.imageUrl,
      required this.email,
      required this.actionImg
      });

  @override
  ConsumerState<OtherProfileWidget> createState() => _OtherProfileWidgetState();
}

class _OtherProfileWidgetState extends ConsumerState<OtherProfileWidget> {
  Presentertwo? _present;

  @override
  void initState() {
    super.initState();
    _present = ref.read(present2);
  }

  @override
  Widget build(BuildContext context) {
    final userMainName = ref.watch(stateMyName);
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
          child: Container(
            width: size.width,
            height: size.height * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: widget.actionImg,
                  child: CircleAvatar(
                    backgroundColor: ColorUse.colorBf,
                    backgroundImage: NetworkImage(widget.imageUrl),
                    radius: size.height * 0.08,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.chat_outlined,
                        size: size.height * 0.04,
                      ),
                      onPressed: () {
                        ref.read(stateToOther.notifier).update((state) => 1);
                        ref.read(stateOtherName.notifier).state = widget.name;
                        ref.read(stateWhomEmail.notifier).state = widget.email;
                        _present!.initChat(widget.email,widget.name).then((value) {
                          print('initchat');
                        });
                      },
                    ),
                    SizedBox(
                      width: size.width * 0.04,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.group_add_outlined,
                        size: size.height * 0.04,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                Text(
                  widget.email,
                  style: TextStyle(
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height * 0.05,
                      ),
                      ProfileTile(
                          ic: Icons.person_outline,
                          value: widget.name,
                          title: 'username'),
                      ProfileTile(
                          ic: Icons.article_outlined, value: widget.bio, title: 'bio'),
                      ProfileTile(
                          ic: Icons.supervised_user_circle_outlined,
                          value: widget.type,
                          title: 'type'),
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
