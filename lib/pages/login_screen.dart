import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:npo_automative_app/block/login_bloc.dart';
import 'package:npo_automative_app/block/login_event.dart';
import 'package:npo_automative_app/block/login_state.dart';
import 'package:npo_automative_app/pages/auth.dart';
import 'package:npo_automative_app/pages/home/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScaffoldBody(),
    );
  }

  Widget _buildScaffoldBody() {
    return BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          return _buildParentWidget(context, state);
        },
        listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('This is a snack bar!!!!'),
            ));
        },
        buildWhen: (previous, current) => _shouldBuildFor(current),
        listenWhen: (previous, current) => _shouldListenFor(current),

    );
  }

  bool _shouldListenFor(LoginState currentState) {
    return currentState is ShowSnackbarState;
  }

  bool _shouldBuildFor(LoginState currentState) {
    return currentState is LoginInitial || currentState is UpdateTextState;
  }

  Widget _buildParentWidget(BuildContext context, LoginState state) {
    return _buildTextWidget(context, state);
  }

  Widget _buildTextWidget(BuildContext context, LoginState state) {
    // Если авторизован - вернуть ХОМ экран, если нет Авторизацию.
    if (state is UpdateTextState) {
      return HomePage(context);
    }
    else {
      return AuthPage(context);
    }
  }
}

  // Widget _buildParentWidget(BuildContext context, LoginState state) {
  //   return SizedBox(
  //     width: double.infinity,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         _buildTextWidget(state),
  //         const SizedBox(
  //           height: 16,
  //         ),
  //         TextButton(
  //           onPressed: () {
  //             context.read<LoginBloc>().add(LoginButtonTappedEvent());
  //           },
  //           child: const Text("Tap me12!!!"),
  //         ),
  //         const SizedBox(
  //           height: 16,
  //         ),
  //         TextButton(
  //             onPressed: () {
  //               context
  //                   .read<LoginBloc>()
  //                   .add(ShowSnackBarButtonTappedEvent());
  //             },
  //             child: const Text("Show Snackbar"))
  //       ],
  //     ),
  //   );
  // }