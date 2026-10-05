import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Muhammad Adeel'), centerTitle: true),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // -------------------------------
            // Portfolio Section
            // -------------------------------

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

            // -------------------------------
            // Expanded Practice Section
            // -------------------------------
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

            // -------------------------------
            // ListView.builder Section
            // -------------------------------
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
          ],
        ),
      ),
    );
  }
}
