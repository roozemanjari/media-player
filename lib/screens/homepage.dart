import 'package:flutter/material.dart';
import 'streamMusic.dart';
import '../data/userData.dart';
import 'assetsUI/assets.dart';
import 'videoStream.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime currentTime;
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    StreamMusic(),
    VideoStream(),
    Assets(),
  ];

  @override
  void initState() {
    super.initState();
    currentTime = DateTime.now();
    setGreetingMessage();
  }

  setGreetingMessage() {
    int currentHour = currentTime.hour;
    if (currentHour >= 0 && currentHour < 12) {
      greetingMessage = "Good morning";
    } else if (currentHour >= 12 && currentHour < 15) {
      greetingMessage = "Good afternoon";
    } else {
      greetingMessage = "Good evening";
    }
    print(greetingMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.wifi_tethering),
            label: 'Stream',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_video),
            label: 'Video Stream',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_drive_file),
            label: 'Assets',
          ),
        ],
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.white70,
        currentIndex: _selectedIndex,
        onTap: (val) {
          setState(() {
            _selectedIndex = val;
          });
        },
      ),
    );
  }
}
