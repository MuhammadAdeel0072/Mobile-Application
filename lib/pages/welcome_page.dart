import 'package:flutter/material.dart';

import '../models/user_data.dart';
import 'login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
    required this.account,
    required this.onAccountCreated,
    required this.onAuthenticated,
  });

  final LocalAccount? account;
  final ValueChanged<LocalAccount> onAccountCreated;
  final ValueChanged<LocalAccount> onAuthenticated;

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => LoginPage(
              account: widget.account,
              onAccountCreated: widget.onAccountCreated,
              onAuthenticated: widget.onAuthenticated,
            ),
          ),
        );
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeTransition(
        opacity: _opacityAnimation,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF101C54), Color(0xFF2455C5), Color(0xFF8167D8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Decorative background circles
              Positioned(top: -80, right: -60, child: _decorationCircle(220)),
              Positioned(
                bottom: -100,
                left: -70,
                child: _decorationCircle(260),
              ),

              SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(28),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Portfolio icon
                        Container(
                          width: 115,
                          height: 115,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.13),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withValues(alpha: 0.65),
                              width: 2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.12),
                                blurRadius: 25,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.person_outline_rounded,
                            size: 72,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 35),

                        const Text(
                          'WELCOME',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 34,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 4,
                          ),
                        ),

                        const SizedBox(height: 12),

                        const Text(
                          'To My Portfolio',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Text(
                          'Explore my journey, skills, and projects.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.85),
                            fontSize: 15,
                            height: 1.6,
                          ),
                        ),

                        const SizedBox(height: 38),

                        const SizedBox(
                          width: 26,
                          height: 26,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 16),

                        Text(
                          'Preparing your experience...',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.8),
                            fontSize: 13,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _decorationCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.05),
      ),
    );
  }
}
