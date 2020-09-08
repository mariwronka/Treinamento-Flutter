import 'package:exercicio7start/pages/datail.page.dart';
import 'package:exercicio7start/pages/feed.page.dart';
import 'package:exercicio7start/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Exercício 7',
        theme: ThemeData(
          fontFamily: 'Helvetica',
          primarySwatch: Colors.blue,
          accentColor: ColorUtils.accentColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: FeedPage.route,
        routes: {
          FeedPage.route: (BuildContext context) => FeedPage(),
          DetailPage.route: (BuildContext context) =>
              DetailPage(ModalRoute.of(context).settings.arguments),
        });
  }
}
