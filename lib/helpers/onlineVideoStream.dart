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
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network('${videourl[widget.i]}');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
    super.initState();
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
          elevation: 0.0,
          title: Text(
            "Video Stream",
          ),
          leading: GestureDetector(
            onTap: () {
              _controller.pause();
              Navigator.pop(context);
            },
            child: Icon(Icons.cancel),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Container(
              padding: EdgeInsets.all(7.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.grey[700],
              ),
              margin: EdgeInsets.all(7.0),
              width: size.width,
              height: (size.height) / 3.5,
              child: FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      // Use the VideoPlayer widget to display the video.
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    // If the VideoPlayerController is still initializing, show a
                    // loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Text(
              "${videoName[widget.i]}",
              style: TextStyle(
                fontSize: 26.0,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30.0)),
            Container(
              width: size.width,
              height: 50.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Color(0xFF2468FB),
                    shape: CircleBorder(),
                    height: 100.0,
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
