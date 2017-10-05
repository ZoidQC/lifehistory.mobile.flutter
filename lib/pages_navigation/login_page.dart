import 'package:flutter/material.dart';
import 'package:life_history_mobile/utils/api_service.dart';

class LoginPage extends StatelessWidget {
  _testHttpCall(BuildContext context, String username, String password) {
    ApiService.login(username, password).then((isLoginSuccessful) {
      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text("Login"),
          content: isLoginSuccessful
              ? new Text("Login success!")
              : new Text("Wrong username or password."),
        ),
      );
    });
  }

  final GlobalKey<FormFieldState<String>> _usernameFieldKey =
      new GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      new GlobalKey<FormFieldState<String>>();

  void _login(BuildContext context) {
    final FormFieldState<String> usernameField = _usernameFieldKey.currentState;
    final FormFieldState<String> passwordField = _passwordFieldKey.currentState;

    _testHttpCall(context, usernameField.value, passwordField.value);
  }

  @override
  Widget build(BuildContext context) {
    return new Form(
        child: new ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      children: <Widget>[
        new Container(
          child: new Image(
            image: const AssetImage('graphics/lh_logo.png'),
          ),
          height: 200.0,
          margin: const EdgeInsets.only(
            top: 40.0,
            bottom: 40.0,
          ),
        ),
        new TextFormField(
          key: _usernameFieldKey,
          decoration: const InputDecoration(
            icon: const Icon(Icons.email),
            hintText: 'What is your email/username?',
            labelText: 'Username',
          ),
        ),
        new TextFormField(
          key: _passwordFieldKey,
          decoration: const InputDecoration(
            icon: const Icon(Icons.lock),
            hintText: 'Enter your password here',
            labelText: 'Password',
          ),
          obscureText: true,
        ),
        new Container(
          padding: const EdgeInsets.all(20.0),
          alignment: const FractionalOffset(0.5, 0.5),
          child: new RaisedButton(
            child: const Text('LOG IN'),
            onPressed: () {
              _login(context);
            },
          ),
        ),
      ],
    ));
  }
}
