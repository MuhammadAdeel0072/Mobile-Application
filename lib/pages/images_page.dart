import 'package:flutter/material.dart';

import 'detail_page.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
        backgroundColor: Colors.green,
      ),

      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,

        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    image: 'assets/Adeel-real.png',
                    tag: 'Adeel-real',
                  ),
                ),
              );
            },
            child: const Hero(
              tag: 'Adeel-real',
              child: Image(
                image: AssetImage('assets/Adeel-real.png'),
                width: 60,
                height: 60,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    image: 'assets/Nature.jpg',
                    tag: 'Nature',
                  ),
                ),
              );
            },
            child: const Hero(
              tag: 'Nature',
              child: Image(
                image: AssetImage('assets/Nature.jpg'),
                width: 60,
                height: 60,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    image: 'assets/Animal.jpg',
                    tag: 'Animal',
                  ),
                ),
              );
            },
            child: const Hero(
              tag: 'Animal',
              child: Image(
                image: AssetImage('assets/Animal.jpg'),
                width: 60,
                height: 60,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    image: 'assets/Parrot.jpg',
                    tag: 'Parrot',
                  ),
                ),
              );
            },
            child: const Hero(
              tag: 'Parrot',
              child: Image(
                image: AssetImage('assets/Parrot.jpg'),
                width: 60,
                height: 60,
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    image: 'assets/Photographer.jpg',
                    tag: 'Photographer',
                  ),
                ),
              );
            },
            child: const Hero(
              tag: 'Photographer',
              child: Image(
                image: AssetImage('assets/Photographer.jpg'),
                width: 60,
                height: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
