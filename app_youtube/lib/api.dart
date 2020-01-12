import 'dart:convert';

import 'package:http/http.dart' as http;

const CHAVE_YOUTUBE_API = "AIzaSyB0EGpVuwuAhybe0i4IPzprY3Fa1RcODsY";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar({String pesquisa = "Android"}) async {
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
      print(dadosJson["items"][0]["snippet"]["title"].toString());
    }
    ;
  }
}
