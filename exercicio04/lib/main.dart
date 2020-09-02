import 'package:flutter/material.dart';
import 'color_palette_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 4',
      debugShowCheckedModeBanner: false,
      home: ColorPalettePage(),
    );
  }
}
