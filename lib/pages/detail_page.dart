import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String tag;

  const DetailPage({super.key, required this.image, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        backgroundColor: Colors.green,
      ),

      body: Center(
        child: Hero(tag: tag, child: Image.asset(image, width: 300)),
      ),
    );
  }
}
