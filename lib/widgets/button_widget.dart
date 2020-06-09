import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool showProgress;

  ButtonWidget(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.white,
                  ),
                ),
              )
            : Text(
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
}
