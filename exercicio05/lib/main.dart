import 'package:exercicio03/pages/login.page.dart';
import 'package:exercicio03/pages/register.page.dart';
import 'package:exercicio03/pages/verification.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  final Map<String, WidgetBuilder> privateRoutes = {
    Login.route: (BuildContext context) => Login(),
    Register.route: (BuildContext context) => Register(),
    Verification.route: (BuildContext context) => Verification(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 5',
      theme: ThemeData(
        fontFamily: 'Lato',
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Login.route,
      routes: privateRoutes,
    );
  }
}
