import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/user_data.dart';
import 'pages/login_page.dart';
import 'pages/profile_page.dart';
import 'pages/signup_page.dart';
import 'pages/welcome_page.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomePage(),
      routes: {
        '/login': (_) => LoginPage(
          account: _registeredAccount,
          onAccountCreated: _saveAccount,
          onAuthenticated: _markAuthenticated,
        ),
        '/signup': (_) => SignUpPage(
          onAccountCreated: _saveAccount,
          onAuthenticated: _markAuthenticated,
        ),
        '/profile': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is! ProfileRouteArguments) {
            throw FlutterError(
              'The /profile route requires ProfileRouteArguments.',
            );
          }

          return ProfilePage(
            userName: arguments.userName,
            successMessage: arguments.successMessage,
          );
        },
      },
    );
  }
}

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget>
    with SingleTickerProviderStateMixin {
  double _size = 150;
  double _turns = 0;
  double _radius = 20;
  Color _color = Colors.blue;
  bool _isAnimated = false;

  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.value = 0.5;
  }

  void _animateBox() {
    setState(() {
      _isAnimated = !_isAnimated;

      if (_isAnimated) {
        _size = 200;
        _turns = 0.125;
        _radius = 100;
        _color = Colors.deepPurple;
        _controller.forward();
      } else {
        _size = 150;
        _turns = 0;
        _radius = 20;
        _color = Colors.blue;
        _controller.reverse();
      }
    });
  }

  void _resetAnimation() {
    setState(() {
      _isAnimated = false;
      _size = 150;
      _turns = 0;
      _radius = 20;
      _color = Colors.blue;
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Flutter Animation Concepts',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 30),

        AnimatedRotation(
          turns: _turns,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
            height: _size,
            width: _size,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(_radius),
              boxShadow: [
                BoxShadow(
                  color: _color.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 4,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: const Icon(
                  Icons.flutter_dash,
                  size: 75,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 30),

        const Text(
          'Size • Color • Rotation • Shape • Scale',
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        ElevatedButton.icon(
          onPressed: _animateBox,
          icon: Icon(_isAnimated ? Icons.refresh : Icons.play_arrow),
          label: Text(_isAnimated ? 'Reverse Animation' : 'Start Animation'),
        ),

        TextButton(
          onPressed: _resetAnimation,
          child: const Text('Reset Animation'),
        ),
      ],
    );
  }
}
