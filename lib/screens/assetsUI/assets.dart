import 'package:flutter/material.dart';
import 'xylophone.dart';
import 'assetsVideo.dart';

class Assets extends StatefulWidget {
  @override
  _AssetsState createState() => _AssetsState();
}

class _AssetsState extends State<Assets> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Assets"),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.purple,
            tabs: [
              Tab(icon: Icon(Icons.music_note)),
              Tab(icon: Icon(Icons.video_library)),
            ],
          ),
        ),
        body: TabBarView(
          physics: BouncingScrollPhysics(),
          children: [
            Xylophone(),
            AssetsVideo(),
          ],
        ),
      ),
    );
  }
}
