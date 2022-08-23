import 'package:npo_automative_app/loign/bloc/login_bloc.dart';
import 'package:npo_automative_app/loign/login_form.dart';
import 'package:npo_automative_app/packages/authentication_repository/lib/src/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const LoginForm(),
        ),
      ),
    );
  }

class LoginPage extends StatelessWidget {

  LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: InkWell(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.black87,
          ),
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Container(
                child: _buildLogo(),
              ),
              SizedBox(height: 90),
              Container(
                padding: EdgeInsets.all(40),
                child: BlocProvider(
                  create:(context) {
                    return LoginBloc(
                      authenticationRepository: 
                        RepositoryProvider.of<AuthenticationRepository>(context)
                    );
                  },
                  child: LoginForm()
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Align(
      alignment: Alignment.topLeft,
        child: Container(
        height: 200,
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              child: Image.asset("assets/images/2.png")
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 54),
              child: ListView(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                children: <Widget>[
                  _buildLogoText("Система"),
                  _buildLogoText("Эффективного"),
                  _buildLogoText("Производства"),
                ]
              )
            ),        
          ]
        ),
      ),
    );
  }

  Widget _buildLogoText(String str) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
      "$str",
      style: TextStyle(
        color: Color.fromARGB(255, 255, 255, 255),
        decorationStyle: TextDecorationStyle.wavy,
        fontSize: 19,
        fontWeight: FontWeight.bold,
        )
      ),
    );
  }
}