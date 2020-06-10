import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';
import '../utils/navigator_page.dart';
import '../pages/home_page.dart';
import '../model/login_model.dart';
import '../model/user.dart';
import '../model/api_response.dart';
import '../utils/alert.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerLogin = TextEditingController(text: 'user');

  final _controllerPassword = TextEditingController(text: '123');

  final _globalKey = GlobalKey<FormState>();

  final _focusPassword = FocusNode();

  bool _showProgress = false;

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
              height: 10,
            ),
            ButtonWidget(
              'Login',
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  //Method click button login
  _onClickLogin() async {
    if (!_globalKey.currentState.validate()) {
      return;
    }
    String user = _controllerLogin.text;
    String password = _controllerPassword.text;

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginModel.login(user, password);

    if (response.ok) {
      User users = response.result;

      print('>>>> $users  ');
      push(context, HomePage(), replace: true);
    } else {
      alert(context, response.msg);
    }
    setState(() {
      _showProgress = false;
    });
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
