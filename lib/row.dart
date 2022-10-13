import 'package:flutter/material.dart';

@override
Widget buatKotak(Color warna, double ukuran) {
  return Container(
    decoration: BoxDecoration(
      color: warna,
    ),
    height: ukuran,
    width: ukuran,
    margin: EdgeInsets.all(10),
  );
}
