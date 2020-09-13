import 'package:exercicio09/Utils/colors.dart';
import 'package:exercicio09/components/item_load.dart';
import 'package:exercicio09/network/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBreedPage extends StatefulWidget {
  @override
  _SearchBreedPageState createState() => _SearchBreedPageState();
}

class _SearchBreedPageState extends State<SearchBreedPage> {
  String _imageUrl = '';
  TextEditingController _typeBreedController = TextEditingController();
  bool _isUpdateImage = false;
  FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) _typeBreedController.clear();
    });
    super.initState();
  }

  _searchBreed(value) {
    _updateImageDog();
  }

  _updateImageDog() async {
    String urlImage = await Api().getDogByBreed(_typeBreedController.text);
    setState(() {
      _imageUrl = urlImage;
      _isUpdateImage = true;
    });
  }

  Widget _showImageDog() {
    if (!_isUpdateImage)
      return Image.asset('assets/images/image_awaiting_search.png');
    _isUpdateImage = false;
    if (_typeBreedController.text.isEmpty)
      return Image.asset(
        'assets/images/image_awaiting_search.png',
        fit: BoxFit.contain,
      );
    return _imageUrl.isNotEmpty
        ? FadeInImage.assetNetwork(
            width: double.infinity,
            placeholder: '',
            image: _imageUrl,
            fit: BoxFit.contain,
          )
        : FadeInImage.assetNetwork(
            width: double.infinity,
            placeholder: '',
            fit: BoxFit.contain,
            image:
                'https://fotos.amomeupet.org/uploads/fotos/1300x0_1568662224_5d7fe2d09bccd.jpeg',
          );
  }

  Widget _showMessageError() {
    return _imageUrl.isEmpty && _typeBreedController.text.isNotEmpty
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/backgroud.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 40,
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _typeBreedController,
                    focusNode: _focusNode,
                    onSubmitted: (String value) => _searchBreed(value),
                    style: TextStyle(fontSize: 18, color: ColorUtils.darkColor),
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
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 80),
                        child: Center(
                          child: itemLoader(),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: _showImageDog(),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _showMessageError(),
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
                    onPressed: _updateImageDog,
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
