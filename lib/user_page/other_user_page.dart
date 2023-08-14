import 'package:attedancebeta/presenter/user_presenter.dart';
import 'package:attedancebeta/state/state_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherUserPage extends ConsumerStatefulWidget {
  const OtherUserPage({super.key});

  @override
  ConsumerState<OtherUserPage> createState() => _OtherUserPageState();
}


class _OtherUserPageState extends ConsumerState<OtherUserPage> {
  Presentertwo? _present;

  @override
  void initState() {
    _present = ref.read(present2);
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    final watchToOther = ref.watch(stateToOther);
    final theUserRoute = ref.watch(stateUserRoute);
    final watchWhom = ref.watch(stateWhomEmail);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: _present!.theOther(watchToOther, theUserRoute, watchWhom),
    );
  }
}