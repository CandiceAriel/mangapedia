import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mangapedia/model/detail.dart';

import '../model/anime.dart';
import '../model/topAnime.dart';

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


class animeRecApi {
  static Future<List<AnimeRecommendation>> getAnimeRec(int recaniID) async{
    final response = await http.get(Uri.parse('https://api.jikan.moe/v4/anime' + '/$recaniID' + '/recommendations'));
    final respBody = json.decode(response.body);

    if (response.statusCode == 200) {
      var animeRecommendationJson = respBody['data'] as List;
      return animeRecommendationJson.map((animerecommendation) => AnimeRecommendation.fromJson(animerecommendation)).toList();
    } else {
      throw Exception('Failed to load anime');
    }

  }
}

class RecentAnimeRecommendationApi {
  static Future<List<RecentAnimeRec>> getRecentMangaRec() async{
    final response = await http.get(Uri.parse('https://api.jikan.moe/v4/recommendations/anime'));
    final respBody = json.decode(response.body);

    if (response.statusCode == 200) {
      // print(respBody['data']);
      var recentmangaRecommendationJson = respBody['data'] as List;
      return recentmangaRecommendationJson.map((recentmangarecommendation) => RecentAnimeRec.fromJson(recentmangarecommendation)).toList();
    } else {
      throw Exception('Failed to load anime');
    }

  }
}

  Future<animeDetail> getAnimeDetail(int malID) async{
    final response = await http.get(Uri.parse('https://api.jikan.moe/v4/anime' + '/$malID'));
    
    if (response.statusCode == 200) {
      final respBody = json.decode(response.body);
      final detailJson = respBody['data'];
      print(detailJson);
      return  animeDetail.fromJson(detailJson);
    } else {
      throw Exception('Failed to load anime');
    }

  }