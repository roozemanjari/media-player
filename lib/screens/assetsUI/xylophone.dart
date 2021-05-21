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
    AudioCache().play("note$index.wav");
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
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          width: size.width,
          height: size.height * 0.62,
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
                height: size.height * 0.08,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
