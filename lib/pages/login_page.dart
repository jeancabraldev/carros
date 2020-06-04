import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _controllerLogin = TextEditingController(text: 'jcabral');
  final _controllerPassword = TextEditingController(text: '123');
  final _globalKey = GlobalKey<FormState>();

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

  //Method body
  _body() {
    return Form(
      key: _globalKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _textField(null, 'Login',
                controller: _controllerLogin, validator: _validateLogin),
            SizedBox(height: 10),
            _textField(null, 'Senha',
                obscureText: true,
                controller: _controllerPassword, validator: _validatePassword),
            SizedBox(
              height: 50,
            ),
            _button('Login', _onClickLogin),
          ],
        ),
      ),
    );
  }

  //Method TextField
  _textField(
    String label,
    String hint, {
    bool obscureText = false,
    controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(
        fontSize: 22,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 22,
          color: Colors.black26,
        ),
      ),
    );
  }

  //Method RaisedButton
  _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  //Method login
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
  String _validatePassword(String text){
    if(text.isEmpty){
      return 'Digite sua senha';
    }
    if(text.length < 3){
      return 'A senha precisa ter pelo menos 3 caracteres';
    }
    return null;
  }

}
