import 'package:flutter/material.dart';

import '../models/user_data.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
    required this.account,
    required this.onLogout,
    required this.onAccountCreated,
    required this.onAuthenticated,
    this.successMessage,
  });

  final LocalAccount account;
  final VoidCallback onLogout;
  final ValueChanged<LocalAccount> onAccountCreated;
  final ValueChanged<LocalAccount> onAuthenticated;
  final String? successMessage;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();

    if (widget.successMessage != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(widget.successMessage!)));
        }
      });
    }
  }

  void _logout() {
    widget.onLogout();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => LoginPage(
          account: widget.account,
          onAccountCreated: widget.onAccountCreated,
          onAuthenticated: widget.onAuthenticated,
        ),
      ),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Muhammad Adeel'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: _logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // Portfolio Section
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/Adeel-real.png'),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'I am a software Engineer. '
                    'Currently learning Mobile app development in Riphah Uni.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          debugPrint('Contact me button clicked');
                        },
                        child: const Text(
                          'Contact me',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        '0318-0******',
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

            const SizedBox(height: 20),

            // Expanded Practice Section
            SizedBox(
              height: 500,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'Hello',
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
                      child: const Center(
                        child: Text(
                          'Hellow',
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
                      child: const Center(
                        child: Text(
                          'Hellow',
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
                      child: const Center(
                        child: Text(
                          'Hellow',
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

            const SizedBox(height: 20),

            // ListView.builder Section
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('$index')),
                  title: Text('Student $index'),
                  subtitle: Text('This is student number $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
