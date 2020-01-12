import 'dart:convert';

import 'package:app_youtube/models/video.dart';
import 'package:http/http.dart' as http;

const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar({String pesquisa = "Android"}) async {
    List<Video> videos;
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&q=$pesquisa");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      try {
        videos = dadosJson["items"]
            .map<Video>((map) => Video.fromJson(map))
            .toList();
      } catch (error) {
        print("$error");
      }
    }

    return videos;
  }
}
