import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npo_automative_app/block/auth_block.dart';
import 'package:npo_automative_app/block/login_bloc.dart';
import 'package:npo_automative_app/models/auth_model.dart';
import 'package:npo_automative_app/pages/auth.dart';
import 'package:npo_automative_app/pages/home/home.dart';
import 'package:npo_automative_app/pages/login_screen.dart';

bool showPage = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  showPage = await getAuth();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'НПО Автомотив',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
      ),
      home: _prepareAuthScreen() //showPage ? HomePage() : AuthPage(),
    );
  }

  Widget _prepareAuthScreen() {
    return BlocProvider(
      create: (BuildContext context) {
        return LoginBloc();
      },
      child: const LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
