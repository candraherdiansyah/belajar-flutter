import 'package:belajarflutter/container_dua.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Belajar Container",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container Widget"),
        ),
        // body: Container(
        //   margin: EdgeInsets.all(20),
        //   transform: Matrix4.rotationZ(0.1),
        //   height: 200,
        //   width: 200,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     color: Colors.blueAccent,
        //   ),
        //   child: Center(
        //     child: Text("ini adalah container"),
        //   ),
        // ),
        body: ContainerDua(),
      ),
    );
  }
}
