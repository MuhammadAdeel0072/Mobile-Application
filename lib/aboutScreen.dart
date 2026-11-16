import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final List<Map<String, dynamic>> skills = [
    {"name": "Flutter", "icon": Icons.phone_android},
    {"name": "Dart", "icon": Icons.code},
    {"name": "C++", "icon": Icons.computer},
    {"name": "Java", "icon": Icons.coffee},
    {"name": "HTML", "icon": Icons.web},
    {"name": "CSS", "icon": Icons.palette},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Me")),

      body: Padding(
        padding: EdgeInsets.all(10),

        child: GridView.builder(
          itemCount: skills.length,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),

          itemBuilder: (context, index) {
            return Card(
              elevation: 5,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(skills[index]["icon"], size: 50, color: Colors.blue),

                  SizedBox(height: 10),

                  Text(
                    skills[index]["name"],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
