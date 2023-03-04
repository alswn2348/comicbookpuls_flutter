import 'package:flutter/material.dart';

class Thumbnail extends StatelessWidget {
  final String thumb, id;
  const Thumbnail({
    super.key,
    required this.id,
    required this.thumb,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: id,
      child: Container(
        //clipBehavior: Clip.hardEdge,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            blurRadius: 15,
            offset: const Offset(6, 6),
            color: Colors.black.withOpacity(0.3),
          ),
        ]),
        width: 150,
        child: const SizedBox(
          height: 200,
        ),
        //child: Image.network(thumb),
      ),
    );
  }
}
