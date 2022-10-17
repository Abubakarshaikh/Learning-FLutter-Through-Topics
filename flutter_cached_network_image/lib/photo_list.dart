import 'package:flutter/material.dart';

import 'photo_card.dart';

class PhotosList extends StatelessWidget {
  const PhotosList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: 20,
      separatorBuilder: ((context, index) => const SizedBox(height: 16)),
      itemBuilder: (context, index) {
        final imageUrl =
            "https://source.unsplash.com/random/?sig=$index/900×700/?foods";
        return Hero(
          tag: imageUrl,
          child: PhotoCard(imageUrl: imageUrl),
        );
      },
    );
  }
}
