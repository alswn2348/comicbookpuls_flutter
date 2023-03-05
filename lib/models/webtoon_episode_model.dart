class WebtoonEpisodeModel {
  final String title, id, rating, date;

  WebtoonEpisodeModel.formJson(Map<String, dynamic> json)
      : title = json['title'],
        id = json['id'],
        rating = json['rating'],
        date = json['date'];
}
