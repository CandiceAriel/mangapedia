import 'dart:convert';

import '../model/topmanga.dart';
import 'package:http/http.dart' as http;

class topmangalistApi {
  static Future<List<topManga>> getTopManga() async{
    final url = 'https://api.jikan.moe/v4/top/manga';
    final Uri todoUrl = Uri.parse(url);
    final response = await http.get(todoUrl);
    final respBody = json.decode(response.body);

    if (response.statusCode == 200) {
      print(respBody);
      var topMangasJson = respBody['data'] as List;
      return topMangasJson.map((topmanga) => topManga.fromJson(topmanga)).toList();
    } else {
      throw Exception('Failed to load manga');
    }

  }
}