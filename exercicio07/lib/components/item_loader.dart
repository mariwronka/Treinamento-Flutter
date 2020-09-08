import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemLoader() {
  return Center(
    child: Platform.isAndroid
        ? CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
          )
        : CupertinoActivityIndicator(),
  );
}
