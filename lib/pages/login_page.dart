import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerLogin = TextEditingController(text: 'jcabral');

  final _controllerPassword = TextEditingController(text: '123');

  final _globalKey = GlobalKey<FormState>();

  final _focusPassword = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _globalKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            TextFieldWidget(
              null,
              'Login',
              controller: _controllerLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              focusNext: _focusPassword,
            ),
            SizedBox(height: 10),
            TextFieldWidget(
              null,
              'Senha',
              obscureText: true,
              controller: _controllerPassword,
              validator: _validatePassword,
              keyboardType: TextInputType.number,
              focusNode: _focusPassword,
            ),
            SizedBox(
              height: 50,
            ),
            ButtonWidget(
              'Login',
              onPressed:  _onClickLogin,
            ),
          ],
        ),
      ),
    );
  }

  //Method click button login
  _onClickLogin() {
    if (!_globalKey.currentState.validate()) {
      return;
    }

    String login = _controllerLogin.text;
    String password = _controllerPassword.text;
    print('$login / $password');
  }

  //Method validate login
  String _validateLogin(String text) {
    if (text.isEmpty) {
      return 'Digite seu usuário';
    }
    return null;
  }

  //Method validate password
  String _validatePassword(String text) {
    if (text.isEmpty) {
      return 'Digite sua senha';
    }
    if (text.length < 3) {
      return 'A senha precisa ter pelo menos 3 caracteres';
    }
    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
