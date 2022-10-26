import 'package:belajarflutter/services/album_service.dart';
import 'package:flutter/material.dart';

import '../models/album_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Album> listAlbum = [];
  AlbumService albumService = AlbumService();

  getData() async {
    listAlbum = await albumService.getData();
    setState(() {});
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blueGrey, Colors.lightBlueAccent])),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  child: Text(listAlbum[index].title),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: listAlbum.length),
        ),
      ),
    );
  }
}
