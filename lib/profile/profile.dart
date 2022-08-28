import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npo_automative_app/authentication/bloc/authentication_bloc.dart';
import 'package:npo_automative_app/packages/user_repository/user_repository.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {

  String descriptionRole(Map<String, dynamic> role) {
    return role['description'];
  }

  @override 
  Widget build(BuildContext context) {
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
            context
              .read<AuthenticationBloc>()
              .add(AuthenticationLogoutRequested());
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
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
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
                      state.user.login,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      descriptionRole(state.user.role),
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      state.user.phone,
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
      },
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