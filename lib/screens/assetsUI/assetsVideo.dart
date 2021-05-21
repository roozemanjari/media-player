import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helpers/assetVideoPlayer.dart';

class AssetsVideo extends StatefulWidget {
  @override
  _AssetsVideoState createState() => _AssetsVideoState();
}

class _AssetsVideoState extends State<AssetsVideo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(),
        SizedBox(height: 20.0),
        ListTile(
          title: Text(
            "Dark Trailer",
            style: TextStyle(fontSize: 35.0),
          ),
          trailing: GestureDetector(
            child: Icon(Icons.exit_to_app),
            onTap: () {
              navigateToVideoPage('darktrailer');
            },
          ),
        ),
        SizedBox(height: 20.0),
        Divider(),
        SizedBox(height: 20.0),
        ListTile(
          title: Text(
            "Mustang Shelby",
            style: TextStyle(fontSize: 35.0),
          ),
          trailing: GestureDetector(
            child: Icon(Icons.exit_to_app),
            onTap: () {
              navigateToVideoPage('car');
            },
          ),
        ),
        SizedBox(height: 20.0),
        Divider(),
      ],
    );
  }

  navigateToVideoPage(String key) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AssetVideoPlayer(key),
      ),
    );
  }
}
