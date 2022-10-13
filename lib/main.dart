import 'package:belajarflutter/column.dart';
import 'package:belajarflutter/row.dart';
import 'package:belajarflutter/row_column.dart';

import './container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ColumnWidget());
  // MaterialApp(
  //   home: Scaffold(
  //     body: SafeArea(
  //       child: Row(
  //         children: [
  //           buatKotak(Colors.greenAccent, 100),
  //           buatKotak(Colors.orangeAccent, 70),
  //           buatKotak(Colors.greenAccent, 50),
  //           buatKotak(Colors.greenAccent, 90),
  //         ],
  //       ),
  //     ),
  //   ),
  // ));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // const Color darkBlue = Color.fromARGB(255, 204, 41, 30);
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       title: "Belajar Flutter",
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Text("Learning"),
//         ),
//         body: const Center(
//           child: Text(
//             "Hello Flutter \nCandra Herdiansyah",
//             style: TextStyle(fontSize: 32, fontStyle: FontStyle.italic),
//           ),
//         ),
//       ),
//     );
//   }
// }
