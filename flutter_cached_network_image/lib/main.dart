// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Cached Network Image"),
//           centerTitle: true,
//         ),
//         body: ListView.separated(
//           padding: const EdgeInsets.all(12),
//           itemCount: 20,
//           separatorBuilder: ((context, index) => const SizedBox(height: 12)),
//           itemBuilder: (context, index) => ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: CachedNetworkImage(
//                 imageUrl:
//                     "https://source.unsplash.com/random?sig=$index/100×100/?fruit",
//                 height: 200,
//                 width: double.infinity,
//                 placeholder: (context, child) {
//                   return Container(color: Colors.black12);
//                 },
//                 errorWidget: (context, error, child) {
//                   return Container(
//                     color: Colors.black12,
//                     alignment: Alignment.center,
//                     child: const Icon(Icons.error, color: Colors.red),
//                   );
//                 },
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }

// --------------------------------- Demo - 2 ---------------

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Cached Network Image")),
        body: ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: 20,
          separatorBuilder: ((context, index) => const SizedBox(height: 16)),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage( 
                imageUrl:
                    "https://source.unsplash.com/random/?sig=$index/900×700/?foods",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.black12),
                errorWidget: ((context, url, error) => Container(
                      color: Colors.black12,
                      child: const Icon(Icons.error, color: Colors.red),
                    )),
              ),
            );
          },
        ),
      ),
    ),
  );
}
