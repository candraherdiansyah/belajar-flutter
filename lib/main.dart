import 'package:belajarflutter/screens/home_screen.dart';
import 'package:belajarflutter/screens/login_screen.dart';
import 'package:belajarflutter/screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget secondScreen = SplashScreenView(
      navigateRoute: CheckAuth(),
      duration: 5000,
      imageSize: 250,
      imageSrc: "assets/images/logo.png",
      text: "Kang Candra",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.cyan,
        Colors.black,
        Colors.purple,
      ],
      backgroundColor: Colors.black,
    );

    return MaterialApp(
      title: 'Splash screen Demo',
      debugShowCheckedModeBanner: false,
      home: CheckAuth(),
      darkTheme: ThemeData(
          brightness: Brightness.dark, accentColor: Colors.blueAccent),
      themeMode: ThemeMode.dark,
    );
  }
}

class CheckAuth extends StatefulWidget {
  @override
  _CheckAuthState createState() => _CheckAuthState();
}

class _CheckAuthState extends State<CheckAuth> {
  bool isAuth = false;

  @override
  void initState() {
    super.initState();
    _checkIfLoggedIn();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      if (mounted) {
        setState(() {
          isAuth = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (isAuth) {
      child = MenuScreen();
    } else {
      child = LoginScreen();
    }

    return Scaffold(
      body: child,
    );
  }
}
