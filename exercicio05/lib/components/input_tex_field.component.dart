import 'package:exercicio03/utils/colors.dart';
import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {

  final String labelText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final bool isPassword;
  final bool required;
  final Function validator;

  InputTextField({
    this.labelText,
    this.controller,
    this.required = true,
    this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.isPassword = false,
    this.validator,
  })  : assert(labelText != null),
        assert(controller != null);

  _validate(value) {
    if (validator != null) {
      return validator(value);
    } else if (required) {
      return value.isEmpty ? 'Please, enter your $labelText!' : null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        cursorColor: Color(0XFFE83F3F),
        keyboardType: this.keyboardType,
        textCapitalization: textCapitalization,
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: ColorUtils.gray),
        ),
        style: TextStyle(color: ColorUtils.black, fontSize: 18.0),
        controller: controller,
        validator: (value) => _validate(value),
      ),
    );
  }
}
