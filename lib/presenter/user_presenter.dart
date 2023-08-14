import 'package:attedancebeta/all_method/method_firebase.dart';
import 'package:attedancebeta/chatpage/all_chat.dart';
import 'package:attedancebeta/format_parse/format.dart';
import 'package:attedancebeta/popup/show.dart';
import 'package:attedancebeta/state/state_manage.dart';
import 'package:attedancebeta/user_page/other_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model_data/model_retrieve.dart';

final present2 = Provider((ref) => Presentertwo(method: ref.read(stateinst)));

class Presentertwo extends Format{
  final MethodFirebase method;
  Presentertwo({required this.method});
  ShowPop show = ShowPop();

  Future<void> addCheckin(String user, String timestamp, String day) async {
    await method.addCheckIn(user, timestamp, day);
  }

  Future<void> addCheckout(String user, String day, String timeout) async {
    print('ch');
    await method.updateCheckOut(user, day, timeout);
  }

  void userNow(String name){
    print(name);
    method.inputUser = name;
  }

  void timeDay(String time){
    print(time);
    method.inputTheTime = time;
  }

  void uUid(){
    method.uuids = uuidFormat();
  }

  String _myName = '';

  set mycomeName(String value){
    _myName = value;
  }

 String get myName => _myName;

  List<ModelFire> filteredAll(List<ModelFire> willList){
    return willList.where((element) {
      return element.userEmail != method.userr;
    }).toList();
  }

  void showTheImage(BuildContext ctx, imageUri){
    show.showBannerImage(ctx, imageUri);
  }

  Future<void> addTheChat(String messageC, String whomTo, String whomName) async {
    await method.addChat(messageC, whomTo, whomName, myName) ;
  }

  Future<void> initChat(String whomTo, String whomName) async {
    await method.initTheChat(whomTo, whomName, myName);
  }

  Widget theOther(int theCase, String theRoutedName, String whomEmail){
    method.userR = theRoutedName;
    switch (theCase){
      case 0:
      return const OtherProfile();
      case 1:
      return AllChatPage(whomEmail: whomEmail,);
      default :
      return const OtherProfile();
    }
  }
}
