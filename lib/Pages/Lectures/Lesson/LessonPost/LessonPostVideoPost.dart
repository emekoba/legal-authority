import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LessonPostVideoPost extends StatelessWidget {
  final String lesson;
  final String course;
  final Function saveToLibrary;

  const LessonPostVideoPost({this.lesson, this.course, this.saveToLibrary});

  @override
  Widget build(BuildContext context) {
    bool _inLibrary = false;

    Future<dynamic> getDetail(String userUrl) async {
      String embedUrl =
          "https://www.youtube.com/oembed?url=$userUrl&format=json";

      //store http request response to res variable
      var res = await http.get(embedUrl);
      print("get youtube detail status code: " + res.statusCode.toString());

      try {
        if (res.statusCode == 200) {
          //return the json from the response
          return json.decode(res.body);
        } else {
          //return null if status code other than 200
          return null;
        }
      } on FormatException catch (e) {
        print('invalid JSON' + e.toString());
        //return null if error
        return null;
      }
    }

    void bruh() async {
      String videoUrl = 'https://www.youtube.com/watch?v=d_m5csmrf7I';
      dynamic jsonData = await getDetail(videoUrl);

      //? you can take anything provided in the JSON, just change the key according to
      //? what is available in the response

      String title = jsonData['title'] as String;
    }

    YoutubePlayerController _youtube_controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(lesson),
        flags: YoutubePlayerFlags(autoPlay: false));

    return Container(
        margin: EdgeInsets.fromLTRB(15, 0, 10, 20),
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(
                    width: 5, color: Theme.of(context).buttonColor))),
        child: YoutubePlayer(
          controller: _youtube_controller,
          progressIndicatorColor: Theme.of(context).buttonColor,
          bufferIndicator: SpinKitFoldingCube(
              size: 70, color: Theme.of(context).buttonColor),
        ));
  }
}
