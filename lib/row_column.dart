import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Belajar Row & Column",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Belajar Row & Column"),
        ),
        body: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.black26,
                child: FlutterLogo(),
                margin: EdgeInsets.all(10),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.redAccent,
                child: FlutterLogo(),
                margin: EdgeInsets.all(10),
              ),
              Container(
                height: 100,
                width: 100,
                color: Colors.redAccent,
                child: FlutterLogo(),
                margin: EdgeInsets.all(10),
              ),
              Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.redAccent,
                    child: FlutterLogo(),
                    margin: EdgeInsets.all(10),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
