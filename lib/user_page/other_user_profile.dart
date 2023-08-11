import 'package:attedancebeta/state/state_manage.dart';
import 'package:attedancebeta/user_page/other_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherProfile extends ConsumerWidget {
  const OtherProfile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    // final size = MediaQuery.sizeOf(context);
    final otherRoutedName = ref.watch(streamRoutedUser);
    return otherRoutedName.when(data: (data){
        return OtherProfileWidget(name: data.userName, bio: data.bio, type: data.type, imageUrl: data.photoUrl, email: data.userEmail);
      }, error: (e,r){
        return Text(e.toString());
      }, loading: (){
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
    
  }
}