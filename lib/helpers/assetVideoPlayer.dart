import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AssetVideoPlayer extends StatefulWidget {
  final String name;
  AssetVideoPlayer(
    this.name,
  );
  @override
  _AssetVideoPlayerState createState() => _AssetVideoPlayerState();
}

class _AssetVideoPlayerState extends State<AssetVideoPlayer> {
  VideoPlayerController _controller;
  Future _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('video/${widget.name}.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // to keep track of user if they are going to some other screen.
    return WillPopScope(
      onWillPop: () {
        _controller.pause();
        Navigator.pop(context);
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Video Player"),
          centerTitle: true,
          leading: GestureDetector(
            child: Icon(Icons.cancel),
            onTap: () {
              _controller.pause();
              Navigator.pop(context);
            },
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
                    // If the VideoPlayerController has finished initialization, use
                    // the data it provides to limit the aspect ratio of the video.
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
              widget.name == "darktrailer" ? "Dark Trailer" : "Mustang Shelby",
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
