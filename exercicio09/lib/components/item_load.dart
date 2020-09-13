import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget itemLoader({Color color}) {
  return Center(
    child: Platform.isAndroid
        ? CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(color),
    )
        : CupertinoActivityIndicator(
      radius: 18,
    ),
  );
}