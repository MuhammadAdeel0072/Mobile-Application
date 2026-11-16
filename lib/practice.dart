import 'package:flutter/material.dart';
import 'package:my_app/splashScreen.dart';
import 'package:my_app/listScreen.dart';
import 'package:my_app/aboutScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void openPage(BuildContext context, Widget page) {
    Navigator.pop(context);

    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Muhammad Adeel'), centerTitle: true),

      // DRAWER SECTION
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Muhammad Adeel"),
              accountEmail: Text("BS Software Engineering"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/Adeel-real.png'),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                openPage(context, SimplePage(title: "Profile"));
              },
            ),

            ListTile(
              leading: Icon(Icons.folder),
              title: Text("Projects"),
              onTap: () {
                openPage(context, ListScreen());
              },
            ),

            ListTile(
              leading: Icon(Icons.code),
              title: Text("About"),
              onTap: () {
                openPage(context, AboutScreen());
              },
            ),

            Divider(),

            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                openPage(context, SimplePage(title: "Settings"));
              },
            ),
          ],
        ),
      ),

      // BODY SECTION
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PORTFOLIO SECTION
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/Adeel-real.png'),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "I am a software Engineer. Currently learning Mobile app development in Riphah Uni.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          print("Contact me button clicked");
                        },
                        child: Text(
                          "Contact me",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      Text(
                        "0318-0******",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // EXPANDED PRACTICE SECTION
            Container(
              height: 500,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "Hello",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "Hellow",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      color: Colors.deepOrangeAccent,
                      child: Center(
                        child: Text(
                          "Hellow",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Container(
                      color: Colors.purple,
                      child: Center(
                        child: Text(
                          "Hellow",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // LISTVIEW.BUILDER SECTION
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text("$index")),
                  title: Text("Student $index"),
                  subtitle: Text("This is student number $index"),
                );
              },
            ),

            // CARD SECTION
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/Adeel-real.png'),
                    ),
                    title: Text("Muhammad Adeel"),
                    subtitle: Text("BS Software Engineering"),
                    trailing: Icon(Icons.person),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(Icons.school),
                    title: Text("Riphah International University"),
                    subtitle: Text("5th Semester"),
                  ),

                  Divider(),

                  ListTile(
                    leading: Icon(Icons.code),
                    title: Text("Flutter Development"),
                    subtitle: Text("Mobile App Development"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SimplePage extends StatelessWidget {
  final String title;

  const SimplePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text("$title Page", style: TextStyle(fontSize: 24))),
    );
  }
}
