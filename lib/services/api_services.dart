import 'dart:convert';

import 'package:comicbookpuls_flutter/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const suecess = 200;
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev/";
  final String today = 'today';

  Future<List<WebtoonModel>> getTodaysToons() async {
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
}
