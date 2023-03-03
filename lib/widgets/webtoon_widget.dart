import 'package:comicbookpuls_flutter/screens/detail_screen.dart';
import 'package:comicbookpuls_flutter/widgets/thumb_widget.dart';
import 'package:flutter/material.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;
  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => DetailScreen(
                  title: title,
                  thumb: thumb,
                  id: id,
                )),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Thumbnail(thumb: thumb),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
