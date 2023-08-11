import 'package:attedancebeta/all_method/method_firebase.dart';
import 'package:attedancebeta/format_parse/format.dart';
import 'package:attedancebeta/state/state_manage.dart';
import 'package:attedancebeta/user_page/other_user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model_data/model_retrieve.dart';

final present2 = Provider((ref) => Presentertwo(method: ref.read(stateinst)));

class Presentertwo extends Format{
  final MethodFirebase method;
  Presentertwo({required this.method});

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

  List<ModelFire> filteredAll(List<ModelFire> willList){
    return willList.where((element) {
      return element.userEmail != method.userr;
    }).toList();
  }

  Widget theOther(int theCase, String theRoutedName){
    method.userR = theRoutedName;
    switch (theCase){
      case 0:
      return const OtherProfile();
      default :
      return const OtherProfile();
    }
  }
}
