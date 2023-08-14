import 'package:attedancebeta/chatpage/chat_tle.dart';
import 'package:attedancebeta/color/color_const.dart';
import 'package:attedancebeta/presenter/user_presenter.dart';
import 'package:attedancebeta/state/state_manage.dart';
import 'package:attedancebeta/widget_control/form_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllChatPage extends ConsumerStatefulWidget {
  final String whomEmail;
  const AllChatPage({super.key, required this.whomEmail});

  @override
  ConsumerState<AllChatPage> createState() => _AllChatPageState();
}

class _AllChatPageState extends ConsumerState<AllChatPage> {
  Presentertwo? _present;
  TextEditingController controlChat = TextEditingController();

  @override
  void initState() {
    super.initState();
    _present = ref.read(present2);
  }

  @override
  Widget build(BuildContext context) {
    final watchWhom = ref.watch(stateOtherName);
    // fina whomEmi
    final watchChat = ref.watch(streamPersChat);
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        color: ColorUse.colorAf,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width,
              height: size.height * 0.1,
              color: ColorUse.mainBg,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        ref.read(stateToOther.notifier).update((state) => 0);
                      },
                      icon: const Icon(Icons.arrow_back, color: Colors.white,)),
                  Text(
                    'Chat',
                    style: TextStyle(
                        fontSize: size.height * 0.03,
                        fontWeight: FontWeight.w600,
                        color: ColorUse.colorText),
                  )
                ],
              ),
            ),
            Expanded(
              child: watchChat.when(data: (data) {
                return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (c, i) {
                      print(data[i].chatName);
                      return Container(
                          padding: const EdgeInsets.all(8),
                          width: size.width,
                          child: Row(
                            mainAxisAlignment:
                                data[i].userName != _present!.myName
                                    ? MainAxisAlignment.start
                                    : MainAxisAlignment.end,
                            children: [
                              ChatTile(
                                  message: data[i].chatName,
                                  timeStamp:
                                      _present!.formatDate(data[i].timestamp.toDate()),
                                  userName: data[i].userName),
                            ],
                          ));
                    });
              }, error: (e, r) {
                return Text(e.toString());
              }, loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
            Container(
              child: Row(
                children: [
                  FormControl(
                      colors: ColorUse.colorText,
                      widths: size.width * 0.8,
                      heights: size.height * 0.08,
                      hint: 'add chat...',
                      controlit: controlChat,
                      icon: Icons.chat),
                      IconButton(onPressed: () async {
                        await _present!.addTheChat(controlChat.text, widget.whomEmail, watchWhom);
                      }, icon: const Icon(Icons.send_outlined, color: Colors.grey,))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
