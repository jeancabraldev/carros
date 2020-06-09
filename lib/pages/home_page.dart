import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carros'),
      ),
      body: _body(),
    );
  }

  //Method body
  _body() {
    return Container(
      child: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
