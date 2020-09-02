import 'package:flutter/material.dart';
import 'package:exercicio02/components/item_list.dart';
import 'components/item_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercício 2',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, size: 24),
          onPressed: () {},
        ),
        title: Text('Postcard'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
        child: Column(
          children: [
            ItemColumn(
              icon: Icons.person,
              iconColor: Color(0xFFFC3875),
              title: 'Recipient',
              description: 'Amelie N Mason',
            ),
            ItemColumn(
              icon: Icons.business,
              iconColor: Color(0xFFFCAB55),
              title: 'Address',
              description:
              '47 Greyfriars Road, CAPHEATON\nUnited Kingdom\nNE19 5PJ',
            ),
            ItemColumn(
              icon: Icons.person,
              iconColor: Color(0xFF22C0FC),
              title: 'Message',
              description:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget nunc condimentum, volutpat diam in, molestie nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris aliquet eros nec diam sodales mollis,  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget nunc condimentum, volutpat diam in, molestie nisl. Pellentesque habitant morbi tristique senectus et netu.',
            ),
            Expanded(
              child: SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  ItemButton(
                    title: 'SAVE DRAFT',
                    color: Colors.green,
                  ),
                  ItemButton(
                    title: 'REVIEW DESIGN',
                    color: Colors.pink.shade400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
