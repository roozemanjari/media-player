import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:mediaplayer/data/musicData.dart';

class WebService {
  static Future<void> fetchmusic() async {
    String url = "http://34.209.51.80/cgi-bin/getmusic.py";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      musicNames = result["result"];
    } else {
      throw Exception("API call failed");
    }
  }
}
