import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:npo_automative_app/block/auth_block.dart';
import 'package:npo_automative_app/block/login_bloc.dart';
import 'package:npo_automative_app/block/login_event.dart';
import 'package:npo_automative_app/pages/home/home.dart';

class AuthPage extends StatelessWidget {
  final BuildContext ctx;
  AuthPage(this.ctx);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: _buildContent(context),
    );

  }
  Widget _buildContent(BuildContext context) {
    return InkWell(
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
              child: _buildForm(context),
            ),
          ]
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
              child: Image.asset('images/2.png'),
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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  AuthUserBloc authUserBloc = AuthUserBloc();

  Widget _buildForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextFormField(
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color.fromARGB(255, 71, 71, 71)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.numbers),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Табель',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextFormField(
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color.fromARGB(255, 71, 71, 71)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Пароль',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color(0xFF0D47A1),
                            Color(0xFF1976D2),
                            Color(0xFF42A5F5),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      ctx.read<LoginBloc>().add(LoginButtonTappedEvent());
                    },
                    child: const Text('Авторизация'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}