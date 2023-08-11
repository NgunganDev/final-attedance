import 'package:attedancebeta/color/color_const.dart';
import 'package:attedancebeta/model_data/model_retrieve.dart';
import 'package:attedancebeta/presenter/user_presenter.dart';
import 'package:attedancebeta/state/state_manage.dart';
import 'package:attedancebeta/user_page/other_user_page.dart';
import 'package:attedancebeta/user_page/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

class AllUser extends ConsumerStatefulWidget {
  const AllUser({super.key});

  @override
  ConsumerState<AllUser> createState() => _AllUserState();
}

class _AllUserState extends ConsumerState<AllUser> {
  Presentertwo? _present;
  @override
  void initState() {
    _present = ref.read(present2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final watchAllUser = ref.watch(streamAllUser);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.2,
              decoration: BoxDecoration(color: ColorUse.mainBg),
            ),
            watchAllUser.when(data: (datas) {
              List<ModelFire> theModel = _present!.filteredAll(datas);
              return Expanded(
                  child: ListView.builder(
                      itemCount: theModel.length,
                      itemBuilder: (c, index) {
                        print(theModel[index].type);
                        return InkWell(
                          onTap: () {
                            ref.read(stateUserRoute.notifier).state = theModel[index].userEmail;
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: const OtherUserPage(),
                                    type: PageTransitionType.fade));
                          },
                          child: UserTile(
                              name: theModel[index].userName,
                              email: theModel[index].userEmail,
                              imageUrl: theModel[index].photoUrl),
                        );
                      }));
            }, error: (e, r) {
              return Center(
                child: Text(e.toString()),
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            })
          ],
        ),
      ),
    );
  }
}
