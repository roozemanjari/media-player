import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediaplayer/data/videoData.dart';
import '../helpers/onlineVideoStream.dart';

class VideoStream extends StatefulWidget {
  @override
  _VideoStreamState createState() => _VideoStreamState();
}

class _VideoStreamState extends State<VideoStream> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Video Stream",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 40.0),
            Container(
              width: size.width,
              height: (size.height) / 4,
              child: Card(
                color: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\"Music Videos\nStreaming from\nAWS S3\"",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = shader,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    Image.asset("assets/cloud.png"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Divider(),
            SizedBox(height: 20.0),
            Container(
              height: 400.0,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int i) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => NetworkVideoPlayer(i),
                      ),
                    );
                  },
                  child: Container(
                    height: 90.0,
                    padding: EdgeInsets.all(2.0),
                    width: size.width,
                    child: Card(
                      color: Colors.white.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 0.0,
                      child: Center(
                        child: Text(
                          videoName[i],
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  final Shader shader = LinearGradient(
    colors: [
      Color(0xFF2468FB),
      Color(0xFFAB1FD9),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 200.0));
}
