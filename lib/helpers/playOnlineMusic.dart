import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../data/musicData.dart';

class PlayOnlineMusic extends StatefulWidget {
  final int i;
  PlayOnlineMusic(
    this.i,
  );
  @override
  _PlayOnlineMusicState createState() => _PlayOnlineMusicState();
}

class _PlayOnlineMusicState extends State<PlayOnlineMusic> {
  AudioPlayer advancedPlayer = AudioPlayer();
  //audioplayer plugin object created
  bool isPlaying;

  @override
  void initState() {
    super.initState();
    advancedPlayer.pause();
    isPlaying = true;
    loadMusic();
  }

  Future loadMusic() async {
    advancedPlayer.play(musicUrl(widget.i));
    //to access whatever is present
    // in the parent class of stateful widget.
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        advancedPlayer.pause();
        Navigator.pop(context);
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Icon(Icons.cancel),
            onTap: () {
              advancedPlayer.pause();
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Music Player",
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              width: size.width,
              height: 350.0,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.white.withOpacity(0.2),
                child: Image(image: AssetImage('assets/main.png')),
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              musicNames[widget.i],
              style: TextStyle(
                fontSize: 26.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.0),
            Container(
              height: 80.0,
              width: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0XFF2E22AC),
                    Color(0xFFE34C9D),
                  ],
                ),
              ),
              child: IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  if (isPlaying) {
                    setState(() {
                      isPlaying = false;
                    });
                    advancedPlayer.pause();
                  } else {
                    setState(() {
                      isPlaying = true;
                    });
                    advancedPlayer.resume();
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
