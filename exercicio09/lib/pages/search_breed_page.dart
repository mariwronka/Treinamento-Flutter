import 'package:exercicio09/Utils/colors.dart';
import 'package:exercicio09/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBreedPage extends StatefulWidget {
  @override
  _SearchBreedPageState createState() => _SearchBreedPageState();
}

class _SearchBreedPageState extends State<SearchBreedPage> {
  String _urlBreedImage = '';
  TextEditingController _typeBreedController = TextEditingController();

  _onChangeTypeBreed(value) {
    _loadBreed();
  }

  _loadBreed() async {
    String urlImage = await Api().getDogByBreed(_typeBreedController.text);
    setState(() {
      _urlBreedImage = urlImage;
    });
  }

  Widget _getImageDog() {
    if (_typeBreedController.text.isEmpty)
      return Image.asset('assets/images/image_awaiting_search.png');
    return _urlBreedImage.isNotEmpty
        ? Image.network(_urlBreedImage)
        : Image.network(
            'https://fotos.amomeupet.org/uploads/fotos/1300x0_1568662224_5d7fe2d09bccd.jpeg');
  }

  Widget _getMessageError() {
    return _urlBreedImage.isEmpty && _typeBreedController.text.isNotEmpty
        ? Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: ColorUtils.alertBackgroud,
              border: Border.all(
                color: ColorUtils.primaryDark,
                width: 1,
              ),
            ),
            child: Text(
              'Essa raça não foi encontrada, por isso vamos mostrar o "Vira-Lata Caramelo", uma das raças de cães mais conhecidas do Brasil',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: ColorUtils.primaryDark,
              ),
            ),
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/backgroud.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _typeBreedController,
                    onChanged: (String value) => _onChangeTypeBreed(value),
                    style: new TextStyle(fontSize: 18, color: ColorUtils.darkColor),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      labelText: 'Digite a raça que você deseja ver',
                      contentPadding: const EdgeInsets.all(14.0),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: ColorUtils.backgroudNotImage,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/images/image_awaiting_search.png',
                      image: _urlBreedImage,
                    ),
                    //child: _getImageDog(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _getMessageError(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: RaisedButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Text(
                        'Buscar mais Doguinhos',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    color: ColorUtils.primaryColor,
                    onPressed: _loadBreed,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
