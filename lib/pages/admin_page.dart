import 'package:flutter/material.dart';

import '../models/user_data.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key, required this.account});

  final LocalAccount account;

  void _logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Logout',
            onPressed: () => _logout(context),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome ${account.name}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
