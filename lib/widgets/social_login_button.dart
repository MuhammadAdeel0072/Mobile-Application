import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.provider,
    required this.onPressed,
  });

  final String provider;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isGoogle = provider.toLowerCase() == 'google';
    final isApple = provider.toLowerCase() == 'apple';
    return SizedBox(
      height: 54,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF172554),
          side: const BorderSide(color: Color(0xFFE2E8F0)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isGoogle)
              Image.asset(
                'assets/google_g_logo.png',
                width: 20,
                height: 20,
                semanticLabel: 'Google logo',
              )
            else if (isApple)
              const FaIcon(
                FontAwesomeIcons.apple,
                size: 20,
                color: Colors.black,
                semanticLabel: 'Apple logo',
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'Continue with $provider',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
