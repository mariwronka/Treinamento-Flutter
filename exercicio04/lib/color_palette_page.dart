import 'package:exercicio04/utils/color_utils.dart';
import 'package:flutter/material.dart';

class ColorPalettePage extends StatefulWidget {
  ColorPalettePage({Key key}) : super(key: key);

  @override
  _ColorPalettePageState createState() {
    return _ColorPalettePageState();
  }
}

class _ColorPalettePageState extends State<ColorPalettePage> {
  List<Color> _paletteColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  List<String> _colorCodes = [
    'FF0000',
    '00FF00',
    '0000FF',
  ];

  Widget _buildInput(int paletteIndex) {
    return TextFormField(
      cursorColor: Colors.black45,
      decoration: InputDecoration(
        hintText: '#FFFFFF',
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
      onChanged: (String text) => _onChanged(text, paletteIndex),
    );
  }

  void _onChanged(String text, paletteIndex) {
    setState(() {
      _colorCodes[paletteIndex] = text;
    });
  }

  Widget _paletteItem(int paletteIndex) {
    return Expanded(
      child: Container(
        color: _paletteColors[paletteIndex],
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: _buildInput(paletteIndex),
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: FlatButton(
              color: Colors.grey.withOpacity(.3),
              child: Text(
                'Atualizar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: _onUpdatePressed,
            ),
          ),
        ],
      ),
    );
  }

  void _onUpdatePressed() {
    List<Color> paletteColors = _colorCodes.map((String e) {
      return e.isNotEmpty ? ColorUtils.fromHex(e) : Colors.grey;
    }).toList();
    setState(() {
      _paletteColors = paletteColors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _paletteItem(0),
            _paletteItem(1),
            _paletteItem(2),
            _buildButton(),
          ],
        ),
      ),
    );
  }
}
