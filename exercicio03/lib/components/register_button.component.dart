import 'package:exercicio03/utils/colors.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final String labelText;
  final Function onPressed;

  RegisterButton({
    this.labelText,
    this.onPressed,
  })  : assert(labelText != null),
        assert(onPressed != null);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 35.0, top: 15),
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  labelText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              color: ColorUtils.red,
              onPressed: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
