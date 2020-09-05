import 'package:exercicio03/components/input_tex_field.component.dart';
import 'package:exercicio03/components/register_button.component.dart';
import 'package:exercicio03/pages/register.page.dart';
import 'package:exercicio03/pages/verification.page.dart';
import 'package:exercicio03/utils/colors.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String route = '/login';

  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  _goToVerification() {
    if (_formKeyLogin.currentState.validate()) {
      Navigator.of(context).pushNamed(Verification.route);
    }
  }

  _goToRegister(BuildContext context) {
    Navigator.of(context).pushNamed(Register.route);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(''),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
            child: Form(
              key: _formKeyLogin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: ColorUtils.black,
                        fontSize: 34,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  InputTextField(
                    labelText: 'Email Address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  InputTextField(
                    labelText: 'Password',
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    isPassword: true,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Text(
                          'Dont Have an Account?',
                          style: TextStyle(
                              color: ColorUtils.red, fontSize: 15),
                        ),
                        onTap: () => _goToRegister(context),
                      )
                    ],
                  ),
                  RegisterButton(
                    labelText: 'Register',
                    onPressed: _goToVerification,
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
