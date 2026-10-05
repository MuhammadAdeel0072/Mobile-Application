import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/user_data.dart';
import 'pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocalAccount? _registeredAccount;
  bool _isAuthenticated = false;

  void _saveAccount(LocalAccount account) {
    setState(() {
      _registeredAccount = account;
    });
  }

  void _markAuthenticated(LocalAccount account) {
    if (_isAuthenticated) return;

    setState(() {
      _registeredAccount = account;
      _isAuthenticated = true;
    });
  }

  void _markLoggedOut() {
    setState(() {
      _isAuthenticated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(
        account: _registeredAccount,
        onAccountCreated: _saveAccount,
        onAuthenticated: _markAuthenticated,
      ),
    );
  }
}
