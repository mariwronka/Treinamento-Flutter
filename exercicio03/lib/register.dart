import 'package:exercicio03/components/input_tex_field.component.dart';
import 'package:exercicio03/components/register_button.component.dart';
import 'package:exercicio03/utils/colors.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _zipCodeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    _fullNameController.text = '';
    _emailController.text = '';
    _phoneNumberController.text = '';
    _countryController.text = '';
    _passwordController.text = '';
    _confirmPasswordController.text = '';
    _zipCodeController.text = '';
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void _registerFields() {
    if (_formKey.currentState.validate()) {
      print('user registrado');
      print('nome ' + _fullNameController.text);
      print('email ' + _emailController.text);
      print('telefone ' + _phoneNumberController.text);
      print('país ' + _countryController.text);
      print('senha ' + _passwordController.text);
      print('cep ' + _zipCodeController.text);
      _showDialog();
    }
  }

  _stringDialog() {
    return 'Name: ${_fullNameController.text}\n\n' +
        'E-mail: ${_emailController.text}\n\n' +
        'Number: ${_phoneNumberController.text}\n\n' +
        'Country: ${_countryController.text}';
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'User Registration',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          content: new Text(_stringDialog()),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Register'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(''),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(
            textColor: Color(0XFFE83F3F),
            onPressed: _resetFields,
            child: Text('Clear',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                )),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: ColorUtils.black,
                        fontSize: 34,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  InputTextField(
                    labelText: 'Full Name',
                    controller: _fullNameController,
                    textCapitalization: TextCapitalization.words,
                  ),
                  InputTextField(
                    labelText: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  InputTextField(
                    labelText: 'Mobile Number',
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.number,
                  ),
                  InputTextField(
                    labelText: 'Country',
                    controller: _countryController,
                    textCapitalization: TextCapitalization.words,
                  ),
                  InputTextField(
                    labelText: 'Password',
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  InputTextField(
                    labelText: 'Confirm Password',
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                    validator: (value) => value != _passwordController.text
                        ? 'Please, check your password they don\'t match!'
                        : null,
                  ),
                  InputTextField(
                    labelText: 'Referal Code (Optional)',
                    controller: _zipCodeController,
                    keyboardType: TextInputType.number,
                    required: false,
                  ),
                  RegisterButton(
                    labelText: 'Register',
                    onPressed: _registerFields,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
