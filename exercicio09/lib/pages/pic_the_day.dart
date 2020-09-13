import 'package:exercicio09/components/item_load.dart';
import 'package:exercicio09/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PicTheDayPage extends StatefulWidget {
  @override
  _PicTheDayPageState createState() => _PicTheDayPageState();
}

class _PicTheDayPageState extends State<PicTheDayPage> {
  String _imageUrl = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateImageDog();
  }

  _updateImageDog() async {
    String urlImage = await Api().getRandomDog();
    setState(() {
      _imageUrl = urlImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/backgroud.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            child: Center(
              child: itemLoader(),
            ),
          ),
          Container(
            child: Center(
              child: FadeInImage.assetNetwork(
                width: double.infinity,
                placeholder: 'assets/images/image_awaiting_search.png',
                image: _imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
