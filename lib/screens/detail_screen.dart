import 'package:comicbookpuls_flutter/models/webtoon_detail_model.dart';
import 'package:comicbookpuls_flutter/models/webtoon_episode_model.dart';
import 'package:comicbookpuls_flutter/services/api_services.dart';
import 'package:comicbookpuls_flutter/widgets/thumb_widget.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episodes = ApiService.getLatestEpisodeById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Thumbnail(
              thumb: widget.thumb,
              id: widget.id,
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        FutureBuilder(
          future: webtoon,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!.about,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      '${snapshot.data!.genre} / ${snapshot.data!.age}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            }
            return const Text('...');
          },
        )
      ]),
    );
  }
}
