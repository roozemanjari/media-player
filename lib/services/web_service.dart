import 'dart:convert';
import "package:http/http.dart" as http;
//http network call
import 'package:mediaplayer/data/musicData.dart';

class WebService {
  static Future<void> fetchmusic() async {
    const String url = "http://34.209.51.80/cgi-bin/getmusic.py";
    //end point of backend
    // Network call to the python service
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      musicNames = result["result"];
    } else {
      throw Exception("API call failed");
    }
  }
}
