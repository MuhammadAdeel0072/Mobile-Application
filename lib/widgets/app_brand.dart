import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class AppBrand extends StatelessWidget {
  const AppBrand({super.key, this.compact = false});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final markSize = compact ? 40.0 : 56.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: markSize,
          height: markSize,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppTheme.accent, AppTheme.primary, AppTheme.secondary],
            ),
            borderRadius: BorderRadius.circular(compact ? 13 : 18),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primary.withValues(alpha: 0.24),
                blurRadius: compact ? 14 : 20,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Icon(
            Icons.code_rounded,
            color: Colors.white,
            size: compact ? 25 : 34,
          ),
        ),
        SizedBox(height: compact ? 6 : 9),
        Text(
          'DevFlow',
          style: TextStyle(
            color: AppTheme.primaryText,
            fontSize: compact ? 18 : 22,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}
