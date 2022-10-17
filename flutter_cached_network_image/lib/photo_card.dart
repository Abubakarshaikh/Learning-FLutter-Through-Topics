import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_network_image/details_screen.dart';

class PhotoCard extends StatelessWidget {
  final String imageUrl;
  const PhotoCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(imageUrl: imageUrl)));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: 200,
          key: UniqueKey(),
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(color: Colors.black12),
          errorWidget: ((context, url, error) => Container(
                color: Colors.black12,
                child: const Icon(Icons.error, color: Colors.red),
              )),
        ),
      ),
    );
  }
}
