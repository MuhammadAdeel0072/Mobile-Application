import 'package:flutter/material.dart';

import 'detail_page.dart';

class AlbumImagesPage extends StatelessWidget {
  const AlbumImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Gallery'),
        backgroundColor: Colors.green,
      ),

      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        children: [
          imageItem(context, 'assets/Adeel-real.png', 'Adeel-real'),
          imageItem(context, 'assets/Nature.jpg', 'Nature'),
          imageItem(context, 'assets/Animal.jpg', 'Animal'),
          imageItem(context, 'assets/Parrot.jpg', 'Parrot'),
          imageItem(context, 'assets/Photographer.jpg', 'Photographer'),
        ],
      ),
    );
  }

  Widget imageItem(BuildContext context, String image, String tag) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(image: image, tag: tag),
          ),
        );
      },

      child: Hero(
        tag: tag,
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
