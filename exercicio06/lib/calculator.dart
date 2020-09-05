import 'package:flutter/material.dart';

import 'memory.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _memory = Memory();
  String _infoResult = '0';

  void applyCommand(String command) {
    var _resultTemp = _infoResult;
    _changeResult('');
    Future.delayed(const Duration(milliseconds: 30), () {
      setState(() {
        _changeResult(_resultTemp);
        _memory.applyCommand(command);
        _changeResult(_memory.setInfoResult());
      });
    });
  }

  _changeResult(String value) {
    setState(() {
      _infoResult = value.replaceAll('.', ',');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text(
                          _infoResult,
                          style: TextStyle(
                            fontSize: 78,
                            color: Color(0xFF3D3D3D),
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 22,
                      label: 'AC',
                      value: 'AC',
                      colorBackgroud: Color(0xFFC4C4C4),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 24,
                      label: '+/-',
                      value: '*-1',
                      colorBackgroud: Color(0xFFC4C4C4),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 25,
                      label: '%',
                      value: '%',
                      colorBackgroud: Color(0xFFC4C4C4),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 40,
                      label: '÷',
                      value: '/',
                      colorBackgroud: Colors.pinkAccent,
                      colorFont: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '1',
                      value: '1',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '2',
                      value: '2',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '3',
                      value: '3',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 40,
                      label: '×',
                      value: '*',
                      colorBackgroud: Colors.pinkAccent,
                      colorFont: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '4',
                      value: '4',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '5',
                      value: '5',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '6',
                      value: '6',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 45,
                      label: '-',
                      value: '-',
                      colorBackgroud: Colors.pinkAccent,
                      colorFont: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '7',
                      value: '7',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '8',
                      value: '8',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: '9',
                      value: '9',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 40,
                      label: '+',
                      value: '+',
                      colorBackgroud: Colors.pinkAccent,
                      colorFont: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: _buildButton(
                      fontSize: 36,
                      label: '0',
                      value: '0',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 36,
                      label: ',',
                      value: '.',
                      colorBackgroud: Color(0xFFE1E1E1),
                      colorFont: Color(0xFF3D3D3D),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _buildButton(
                      fontSize: 40,
                      label: '=',
                      value: '=',
                      colorBackgroud: Colors.pinkAccent,
                      colorFont: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    double fontSize,
    String label,
    String value,
    Color colorBackgroud,
    Color colorFont,
  }) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: double.infinity,
      child: RaisedButton(
        color: colorBackgroud,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
                color: colorFont,
              ),
            ),
          ),
        ),
        onPressed: () => applyCommand(value),
      ),
    );
  }
}
