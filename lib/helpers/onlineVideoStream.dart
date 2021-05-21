import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../data/videoData.dart';

class NetworkVideoPlayer extends StatefulWidget {
  final int i;
  NetworkVideoPlayer(
    this.i,
  );
  @override
  _NetworkVideoPlayerState createState() => _NetworkVideoPlayerState();
}

class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(videourl[widget.i]);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        _controller.pause();
        Navigator.pop(context);
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Video Stream"),
          leading: GestureDetector(
            onTap: () {
              _controller.pause();
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(7.0),
              width: size.width,
              height: (size.height) / 3.5,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController is already initialized, show a
                    // video
                    return VideoPlayer(_controller);
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              videoName[widget.i],
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: 70.0,
              height: 70.0,
              child: MaterialButton(
                color: Colors.purple,
                shape: CircleBorder(),
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
