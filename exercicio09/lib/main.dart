import 'package:exercicio09/Utils/colors.dart';
import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 9',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primaryColor: ColorUtils.primaryColor,
        accentColor: ColorUtils.primaryDark,
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}