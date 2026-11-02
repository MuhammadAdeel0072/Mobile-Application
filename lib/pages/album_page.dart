import 'package:flutter/material.dart';

import 'album_images_page.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Albums'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.folder, color: Colors.green, size: 50),
            title: const Text('My Gallery'),
            subtitle: const Text('5 Photos'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AlbumImagesPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
