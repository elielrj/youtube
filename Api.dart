import 'dart:async';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_TOUTUBE_API = "AIzaSyAoK4IVP7d8E20NvVD7DLfDROmUZZhVDlw";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>> pesquisar(String pesquisa) async {

    http.Response response = await http.get(
      Uri.parse(URL_BASE + "search"
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_TOUTUBE_API"
          "&channelId=$ID_CANAL"
          "&q=$pesquisa"
      ),
    );

    List<Video> videos = [];

    if(response.statusCode == 200){

      Map<String, dynamic> dadosJson = json.decode(response.body);

      videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();

      return videos;

      print("resultado: " + dadosJson["items"][0]["id"]["videoId"].toString());

    }else{
      return videos;
    }

  }
}