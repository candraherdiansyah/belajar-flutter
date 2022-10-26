import 'package:belajarflutter/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget secondScreen = SplashScreenView(
      navigateRoute: LoginScreen(),
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
      home: secondScreen,
    );
  }
}
