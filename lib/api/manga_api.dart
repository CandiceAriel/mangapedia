import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mangadex_library/mangadex_library.dart' as lib;

import '../model/manga.dart';
import '../model/topManga.dart';
import '../model/mangadetail.dart';

class mangalistApi {
  static Future<List<Manga>> getManga() async{
    final url = 'https://api.jikan.moe/v4/schedules';
    final Uri todoUrl = Uri.parse(url);
    final response = await http.get(todoUrl);
    final respBody = json.decode(response.body);

    if (response.statusCode == 200) {
      //print(respBody);
      var mangasJson = respBody['data'] as List;
      return mangasJson.map((manga) => Manga.fromJson(manga)).toList();
    } else {
      throw Exception('Failed to load manga');
    }

  }
}

class topmangalistApi {
  static Future<List<topManga>> getTopManga() async{
    final url = 'https://api.jikan.moe/v4/top/manga';
    final Uri todoUrl = Uri.parse(url);
    final response = await http.get(todoUrl);
    final respBody = json.decode(response.body);

    if (response.statusCode == 200) {
      // print(respBody);
      var topMangasJson = respBody['data'] as List;
      return topMangasJson.map((topmanga) => topManga.fromJson(topmanga)).toList();
    } else {
      throw Exception('Failed to load manga');
    }

  }
}

 Future<mangadetail> getMangaDetail(int malID) async{
    final response = await http.get(Uri.parse('https://api.jikan.moe/v4/manga' + '/${malID}'));
    
    if (response.statusCode == 200) {
      final respBody = json.decode(response.body);
      final detailJson = respBody['data'];
      print(detailJson);
      return  mangadetail.fromJson(detailJson);
    } else {
      throw Exception('Failed to load manga');
    }

  }