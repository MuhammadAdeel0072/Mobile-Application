import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final List<String> projects = [
    "FoodLink",
    "Khareedo",
    "Student Course Portal",
    "InternLink",
    "TileDesk",
    "Flutter App",
    "Portfolio Website",
    "Weather App",
    "Calculator App",
    "To-Do App",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Projects")),

      body: ListView.builder(
        itemCount: projects.length,

        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text("${index + 1}")),

            title: Text(projects[index]),

            subtitle: Text("Project ${index + 1}"),

            trailing: Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
