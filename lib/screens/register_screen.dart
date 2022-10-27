import 'package:belajarflutter/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:belajarflutter/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;
  late String name, email, password;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    // _scaffoldKey.currentState!.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xff151515),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 72),
          child: Column(
            children: [
              Card(
                elevation: 4.0,
                color: Colors.white10,
                margin: EdgeInsets.only(top: 86),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "RegisterScreen",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 18),
                        TextFormField(
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Full Name",
                            ),
                            validator: (nameValue) {
                              if (nameValue!.isEmpty) {
                                return 'Please enter your full name';
                              }
                              name = nameValue!;
                              return null;
                            }),
                        SizedBox(height: 12),
                        TextFormField(
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: "Email",
                            ),
                            validator: (emailValue) {
                              if (emailValue!.isEmpty) {
                                return 'Please enter your email';
                              }
                              email = emailValue!;
                              return null;
                            }),
                        SizedBox(height: 12),
                        TextFormField(
                            cursorColor: Colors.blue,
                            keyboardType: TextInputType.text,
                            obscureText: _secureText,
                            decoration: InputDecoration(
                              hintText: "Password",
                              suffixIcon: IconButton(
                                onPressed: showHide,
                                icon: Icon(_secureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                            ),
                            validator: (passwordValue) {
                              if (passwordValue!.isEmpty) {
                                return 'Please enter your password';
                              }
                              password = passwordValue!;
                              return null;
                            }),
                        SizedBox(height: 12),
                        TextButton(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            child: Text(
                              _isLoading ? 'Proccessing..' : 'RegisterScreen',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _registerScreen();
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _registerScreen() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'name': name, 'email': email, 'password': password};

    var res = await Network().auth(data, '/registerScreen');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MenuScreen()),
      );
    } else {
      if (body['message']['name'] != null) {
        _showMsg(body['message']['name'][0].toString());
      } else if (body['message']['email'] != null) {
        _showMsg(body['message']['email'][0].toString());
      } else if (body['message']['password'] != null) {
        _showMsg(body['message']['password'][0].toString());
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
