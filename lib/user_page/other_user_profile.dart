import 'package:attedancebeta/presenter/user_presenter.dart';
import 'package:attedancebeta/state/state_manage.dart';
import 'package:attedancebeta/user_page/other_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherProfile extends ConsumerStatefulWidget {
  const OtherProfile({super.key});

  @override
  ConsumerState<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends ConsumerState<OtherProfile> {
Presentertwo? _present;

  @override
  void initState() {
    super.initState();
    _present = ref.read(present2);
    
  }
  @override
  Widget build(BuildContext context, ) {
    // final size = MediaQuery.sizeOf(context);
    final otherRoutedName = ref.watch(streamRoutedUser);
    return otherRoutedName.when(data: (data) {
      return OtherProfileWidget(
          name: data.userName,
          bio: data.bio,
          type: data.type,
          imageUrl: data.photoUrl,
          email: data.userEmail,
          actionImg: (){
            _present!.showTheImage(context, data.photoUrl);
          },
          );
    }, error: (e, r) {
      return Text(e.toString());
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
