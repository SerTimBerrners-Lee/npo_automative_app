import 'package:flutter/material.dart';
import 'package:npo_automative_app/block/auth_block.dart';
import 'package:npo_automative_app/block/login_bloc.dart';
import 'package:npo_automative_app/block/login_event.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget  {
  final BuildContext ctx;
  ProfilePage(this.ctx);

  @override 
  Widget build(BuildContext context) {
    print('PROFILE: $ctx');
    AuthUserBloc authUserBloc = AuthUserBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          'Профиль',
          style:
              TextStyle(fontSize: 17, color: Colors.white, letterSpacing: 0.53),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        leading: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                size: 20,
              ),
            ),
          ),
        actions: [
          InkWell(
          onTap: () async {
            print('in tab');
            ctx.read<LoginBloc>().add(LoginButtonTappedEvent(false));
          },
          child: Icon(
            Icons.exit_to_app,
            color: Colors.white,
          ),
        ),
        ],
        bottom: PreferredSize(
            child: getAppBottomView(), 
                   preferredSize: Size.fromHeight(110.0)),
      ),
      body: Center(),
    );
  }


  Widget getAppBottomView() {
    return Container(
      padding: EdgeInsets.only(left: 30, bottom: 20),
      child: Row(
        children: [
          getProfileView(),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Перов Д.А.',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                Text(
                  'Программист',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '+7 920 418 38 55',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getProfileView() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.white,
          child: Icon(Icons.person_outline_rounded),
        ),
        Positioned(
            bottom: 1,
            right: 1,
            child: Container(
              height: 30,
              width: 30,
              child: Icon(
                Icons.edit,
                color: Colors.deepPurple,
                size: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ))
      ],
    );
  }
}