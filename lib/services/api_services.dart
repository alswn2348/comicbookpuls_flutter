import 'dart:convert';

import 'package:comicbookpuls_flutter/models/webtoon_detail_model.dart';
import 'package:comicbookpuls_flutter/models/webtoon_episode_model.dart';
import 'package:comicbookpuls_flutter/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const suecess = 200;
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = 'today';

  static Future<List<WebtoonModel>> getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');
    final respnse = await http.get(url);
    List<WebtoonModel> webtoonInstances = [];
    if (respnse.statusCode == suecess) {
      final List<dynamic> webtoons = jsonDecode(respnse.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getTonnById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == suecess) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.formJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebtoonEpisodeModel> episodesIntances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == suecess) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesIntances.add(WebtoonEpisodeModel.formJson(episode));
      }
      return episodesIntances;
    }
    throw Error();
  }
}
