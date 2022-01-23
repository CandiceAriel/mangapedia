import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mangapedia/model/detail.dart';

import '../model/anime.dart';
import '../model/topAnime.dart';
import '../model/detail.dart';

class animelistApi {
  static Future<List<Anime>> getAnime() async{
    final url = 'https://api.jikan.moe/v4/watch/episodes';
    final Uri animeUrl = Uri.parse(url);
    final response = await http.get(animeUrl);
    final respBody = json.decode(response.body);

    if (response.statusCode == 200) {
      var animeJson = respBody['data'] as List;
      return animeJson.map((anime) => Anime.fromJson(anime)).toList();
    } else {
      throw Exception('Failed to load anime');
    }

  }
}

class topanimelistApi {
  static Future<List<topAnime>> getTopAnime() async{
    final url = 'https://api.jikan.moe/v4/top/anime';
    final Uri animeUrl = Uri.parse(url);
    final response = await http.get(animeUrl);
    final respBody = json.decode(response.body);

    if (response.statusCode == 200) {
      var topanimeJson = respBody['data'] as List;
      return topanimeJson.map((topanime) => topAnime.fromJson(topanime)).toList();
    } else {
      throw Exception('Failed to load anime');
    }

  }
}



  Future<animeDetail> getAnimeDetail(int malID) async{
    final response = await http.get(Uri.parse('https://api.jikan.moe/v4/anime' + '/${malID}'));
    
    if (response.statusCode == 200) {
      final respBody = json.decode(response.body);
      final detailJson = respBody['data'];
      print(detailJson);
      return  animeDetail.fromJson(detailJson);
    } else {
      throw Exception('Failed to load anime');
    }

  }


// class animeDetailApi{
//   Future<AnimeDetail> getAnimeDetail(String anime_malID) async{
//     final url = 'https://api.jikan.moe/v4/anime/' + anime_malID;
//     final Uri animeUrl = Uri.parse(url);
//     final response = await http.get(animeUrl);
//     final respBody = json.decode(response.body);

//     if (response.statusCode == 200) {
//       print(animeUrl);
//       print(respBody);
//       return AnimeDetail.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load anime');
//     }

//   }
// }