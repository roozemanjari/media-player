import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Xylophone extends StatefulWidget {
  @override
  _XylophoneState createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  List<Color> colors = [
    Colors.white,
    Colors.purple,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
  ];

  void playCache(int index) {
    index = index + 1;
    AudioCache player = AudioCache();
    player.play("note$index.wav");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Xylophone",
          style: TextStyle(fontSize: 35.0),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          width: size.width,
          height: size.height * 0.6,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 7,
            itemBuilder: (BuildContext context, int i) => GestureDetector(
              onTap: () {
                playCache(i);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: colors[i],
                ),
                margin: EdgeInsets.only(top: 10.0),
                width: size.width,
                height: size.height / 12,
                child: Card(
                  margin: EdgeInsets.all(0.0),
                  elevation: 10.0,
                  color: colors[i],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: 20.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.grey[500], Colors.grey[100]],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10.0),
                        width: 20.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [Colors.grey[500], Colors.grey[100]],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
