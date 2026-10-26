import 'package:flutter/material.dart';

import '../animation.dart';

class ProfileRouteArguments {
  const ProfileRouteArguments({required this.userName, this.successMessage});

  final String userName;
  final String? successMessage;
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.userName, this.successMessage});

  final String userName;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.userName}'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (_) => false,
              );
            },
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

            const SizedBox(height: 20),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                final studentNumber = index + 1;

                return ListTile(
                  leading: CircleAvatar(child: Text('$studentNumber')),
                  title: Text('Student $studentNumber'),
                );
              },
            ),

            const SizedBox(height: 24),

            const AnimatedContainerWidget(),
          ],
        ),
      ),
    );
  }
}
