import 'dart:async';

import 'package:flutter/material.dart';

class Memory {
  static const operations = ['/', '+', '-', '*', '='];
  var _numbers = [0.0, 0.0];

  String _operation;
  bool _usedOperation = false;
  int _index = 0;
  String result = '0';

  void _clear() {
    result = '0';
    _numbers = [0.0, 0.0];
    _index = 0;
    _operation = null;
    _usedOperation = false;
    _changeResult(result);
  }

  void applyCommand(String command) {
    if (command == 'AC') {
      _clear();
    } else if (command == '*-1') {
      _addPlusAndMinus();
    } else if (command == '%') {
      _addPercentage();
    } else if (operations.contains(command)) {
      _addOperation(command);
    } else {
      _addDigit(command);
    }
  }

  void _addDigit(String digit) {
    if (_usedOperation) result = '0';
    _validateDoubleNumber(digit);
    _numbers[_index] = double.tryParse(result);
    _usedOperation = false;
    _changeResult(result);
  }

  void _addPlusAndMinus() {
    if (_usedOperation) result = '0';
    _validatePlusAndMinus(result);
    _numbers[_index] = double.tryParse(result);
    _usedOperation = false;
    _changeResult(result);
  }

  void _addPercentage() {
    if (_usedOperation) result = '0';
    _validatePercentage(result);
    _numbers[_index] = double.tryParse(result);
    _usedOperation = false;
    _changeResult(result);
  }

  void _validatePercentage(String value) {
    value = value.replaceAll(',', '.');
    value = (double.tryParse(value) / 100).toString();
    value = value.endsWith('.0') ? value.split('.')[0] : value;
    result = value;
  }

  void _validatePlusAndMinus(String value) {
    if(value != '0') {
      value = value.replaceAll(',', '.');
      value = (double.tryParse(value) * -1).toString();
      value = value.endsWith('.0') ? value.split('.')[0] : value;
    }
    result = value;
  }

  void _validateDoubleNumber(String digit) {
    if (result.contains('.') && digit == '.') digit = '';
    if (result == '0' && digit != '.') result = '';
    result += digit;
  }

  void _addOperation(String operation) {
    if (_usedOperation && operation == _operation) {
      _changeResult(result);
      return;
    }
    _setIndexNumbers();
    _setOperation(operation);
    _setFormattedResult();

    _usedOperation = true;
    _changeResult(result);
  }

  void _setOperation(String operation) {
    if (operation != '=') {
      _operation = operation;
    } else {
      _numbers[1] = 0;
    }
  }

  void _setIndexNumbers() {
    if (_index == 0)
      _index = 1;
    else
      _numbers[0] = _calculate();
  }

  void _setFormattedResult() {
    result = _numbers[0].toString();
    result = result.endsWith('.0') ? result.split('.')[0] : result;
  }

  double _calculate() {
    switch (_operation) {
      case '%': {
        return (_numbers[0] * 100) / _numbers[1];
      }
      case '/':
        return _numbers[0] / _numbers[1];
      case '*':
        return _numbers[0] * _numbers[1];
      case '+':
        return _numbers[0] + _numbers[1];
      case '-':
        return _numbers[0] - _numbers[1];
      default:
        return 0.0;
    }
  }

  void _changeResult(String value) {
    if (value.contains('.')) {
      var index = 10;
      value = double.tryParse(value).toStringAsPrecision(index);
      while (value.endsWith('0')) {
        value = value.substring(0, value.length - 1);
        index = index - 1;
      }
    }
    result = value;
  }
  
  String setInfoResult() {
    return result.replaceAll('.', ',');
  }
}
