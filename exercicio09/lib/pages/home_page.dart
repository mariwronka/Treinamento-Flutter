import 'package:exercicio09/pages/pic_the_day.dart';
import 'package:exercicio09/pages/search_breed_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> _titles = [
    'Buscar por Raça',
    'Doguinho do Dia',
  ];

  final List<Widget> _children = [
    SearchBreedPage(),
    PicTheDayPage()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text(
              _titles[0],
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
            ),
            title: Text(
              _titles[1],
            ),
          ),
        ],
      ),
    );
  }
}
