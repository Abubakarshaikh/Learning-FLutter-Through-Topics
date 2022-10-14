import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  static final customCachedManager = CacheManager(
    Config(
      'customCachedKey',
      stalePeriod: const Duration(days: 15),
      maxNrOfCacheObjects: 100,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cached Network Image"),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 20,
        separatorBuilder: ((context, index) => const SizedBox(height: 12)),
        itemBuilder: (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            cacheManager: customCachedManager,
            key: UniqueKey(),
            imageUrl:
                "https://source.unsplash.com/random?sig=$index/100×100/?fruit",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            placeholder: ((context, url) => Container(color: Colors.black12)),
            errorWidget: ((context, url, error) => Container(
                  color: Colors.black12,
                  child: const Icon(Icons.error, color: Colors.red, size: 80),
                )),
          ),
        ),
      ),
    );
  }
}
