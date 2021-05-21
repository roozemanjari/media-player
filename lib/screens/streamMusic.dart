import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/userData.dart';
import '../data/musicData.dart';
import '../helpers/playOnlineMusic.dart';

class StreamMusic extends StatefulWidget {
  @override
  _StreamMusicState createState() => _StreamMusicState();
}

class _StreamMusicState extends State<StreamMusic> {
  formatter(int i) {
    String value = musicNames[i];
    if (value.length > 40) {
      value = value.substring(0, 41);
      value = value + ".......";
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Music Stream",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: size.height + 1450.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                width: size.width,
                child: Text(
                  "$greetingMessage,\nRooze",
                  style: TextStyle(
                    fontSize: 35.0,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: size.width,
                height: (size.height) / 4,
                child: Card(
                  color: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\"Stream Online\nListen Anytime\nAnywhere\"",
                        style: TextStyle(
                          fontSize: 30.0,
                          foreground: Paint()..shader = shader,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      Image.asset("assets/icon.png"),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Divider(thickness: 1.0),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.only(left: 20.0),
                width: size.width,
                child: Text(
                  "All songs",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              SizedBox(height: 10.0),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: musicNames.length,
                    itemBuilder: (BuildContext context, int i) =>
                        GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PlayOnlineMusic(i),
                          ),
                        );
                      },
                      child: Container(
                        height: 90.0,
                        width: size.width,
                        padding: EdgeInsets.all(2.0),
                        child: Card(
                          color: Colors.white.withOpacity(0.1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 0.0,
                          child: Row(
                            children: [
                              SizedBox(width: 10.0),
                              CircleAvatar(
                                radius: 28.0,
                                child: Image.asset("assets/mus.png"),
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                formatter(i),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

final Shader shader = LinearGradient(
  colors: <Color>[Color(0xFF2468FB), Color(0xFFAB1FD9)],
).createShader(Rect.fromLTWH(0.0, 0.0, 250.0, 200.0));
