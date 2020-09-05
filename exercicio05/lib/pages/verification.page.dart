import 'dart:io';

import 'package:exercicio03/components/register_button.component.dart';
import 'package:exercicio03/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code_input/flutter_verification_code_input.dart';

class Verification extends StatefulWidget {
  static const String route = '/verification';

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Platform.isAndroid
              ? Icon(Icons.arrow_back, size: 24)
              : Icon(Icons.arrow_back_ios, size: 24),
          color: ColorUtils.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Text(
                'Verification',
                style: TextStyle(
                  color: ColorUtils.black,
                  fontSize: 34,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'a four digit verification code has been sent to your mobile number',
              style: TextStyle(
                color: ColorUtils.black,
                fontSize: 17,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            VerificationCodeInput(
              keyboardType: TextInputType.number,
              length: 4,
              onCompleted: (String value) {
                print(value);
              },
            ),
            SizedBox(
              height: 70,
            ),
            RegisterButton(
              labelText: 'Verify',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
