import 'package:npo_automative_app/loign/bloc/login_bloc.dart';
import 'package:npo_automative_app/loign/bloc/login_event.dart';
import 'package:npo_automative_app/loign/bloc/login_state.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextFormField(
              key: const Key('loginForm_usernameInput_textField'),
              onChanged: (username) =>
                context.read<LoginBloc>().add(LoginUsernameChanged(username)),
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color.fromARGB(255, 71, 71, 71)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Табель',
                errorText: state.username.invalid ? 'invalid username' : null,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return Theme(
            data: Theme.of(context).copyWith(splashColor: Colors.transparent),
            child: TextFormField(
              onChanged: (password) =>
                context.read<LoginBloc>().add(LoginPasswordChanged(password)),
              obscureText: true,
              key: const Key('loginForm_passwordInput_textField'),
              autofocus: false,
              style: TextStyle(fontSize: 22.0, color: Color.fromARGB(255, 71, 71, 71)),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.numbers),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Пароль',
                errorText: state.password.invalid ? 'invalid password' : null,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          );
      },
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ClipRRect(
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
                    key: const Key('loginForm_continue_raisedButton'),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(10.0),
                      primary: Colors.white,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
                    child: const Text('Авторизация'),
                  ),
                ],
              ),
            );
      },
    );
  }
}