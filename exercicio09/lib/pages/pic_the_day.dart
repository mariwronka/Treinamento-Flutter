import 'package:exercicio09/utils/colors.dart';
import 'package:flutter/cupertino.dart';

class PicTheDayPage extends StatefulWidget {
  @override
  _PicTheDayPageState createState() => _PicTheDayPageState();
}

class _PicTheDayPageState extends State<PicTheDayPage> {
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
      child: Center(
        child: Container(
          color: ColorUtils.backgroudNotImage,
          //child: Image.asset('assets/images/image_awaiting_search.png')
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/image_awaiting_search.png',
            image:
            'http://www.dognamoro.com.br/wp-content/uploads/2016/12/imagens-de-cachorros-fofinhos-4.jpg',
          ),
        ),
      ),
    );
  }
}
