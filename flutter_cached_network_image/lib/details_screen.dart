import 'package:flutter/material.dart';

import 'package:flutter_cached_network_image/photo_card.dart';

class DetailsScreen extends StatelessWidget {
  final String imageUrl;
  const DetailsScreen({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details Screen")),
      body: ListView(
        children: [
          Hero(
            tag: imageUrl,
            child: PhotoCard(imageUrl: imageUrl),
          ),
          const SizedBox(height: 16),
          const Text("Photo Galler"),
          const SizedBox(height: 12),
          const Text("Photo Galler"),
          const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
        ],
      ),
    );
  }
}
