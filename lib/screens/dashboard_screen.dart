import 'package:flutter/material.dart';

import '../widgets/app_brand.dart';
import '../widgets/feature_card.dart';
import '../widgets/stats_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedNavIndex = 0;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showDetails(String title, String details) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(details),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _entrance(Widget child, int index) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: Duration(milliseconds: 420 + (index * 90)),
      curve: Curves.easeOutCubic,
      builder: (context, value, animatedChild) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 18 * (1 - value)),
            child: animatedChild,
          ),
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: AppBrand(compact: true)),
              const SizedBox(height: 18),
              // Scaffold -> SafeArea -> SingleChildScrollView -> Column ->
              // Container -> Column -> Row -> CircleAvatar -> Column -> Text
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFF4338CA),
                      Color(0xFF5B3FD8),
                      Color(0xFF7C3AED),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4338CA).withValues(alpha: 0.24),
                      blurRadius: 22,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      right: -28,
                      top: -38,
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.08),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: Color(0xFFF5F3FF),
                              child: CircleAvatar(
                                radius: 27,
                                backgroundColor: Color(0xFFDDD6FE),
                                child: Icon(
                                  Icons.person_rounded,
                                  color: Color(0xFF4338CA),
                                  size: 34,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome Back',
                                    style: TextStyle(
                                      color: Color(0xFFE0E7FF),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Adeel',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 19,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    'Software Engineering Student',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Color(0xFFE0E7FF),
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              tooltip: 'Notifications',
                              onPressed: () =>
                                  _showMessage('You have 3 new notifications'),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.white.withValues(
                                  alpha: 0.14,
                                ),
                                foregroundColor: Colors.white,
                              ),
                              icon: const Badge(
                                smallSize: 8,
                                backgroundColor: Color(0xFFFBBF24),
                                child: Icon(Icons.notifications_outlined),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Muhammad Adeel  ·  5th Semester',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Riphah International University, Islamabad',
                          style: TextStyle(
                            color: Color(0xFFE0E7FF),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Academic & Activity',
                style: TextStyle(
                  color: Color(0xFF172554),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'Project and task figures are sample values, not live data.',
                style: TextStyle(color: Color(0xFF64748B), fontSize: 11),
              ),
              const SizedBox(height: 12),
              LayoutBuilder(
                builder: (context, constraints) {
                  final cardWidth = (constraints.maxWidth - 20) / 3;
                  return Row(
                    children: [
                      SizedBox(
                        width: cardWidth,
                        child: _entrance(
                          const StatsCard(
                            icon: Icons.school_outlined,
                            value: '3.87',
                            label: 'CGPA',
                            colors: [Color(0xFFEEF2FF), Color(0xFF4338CA)],
                          ),
                          0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: cardWidth,
                        child: _entrance(
                          const StatsCard(
                            icon: Icons.folder_outlined,
                            value: '12',
                            label: 'Projects',
                            colors: [Color(0xFFEFF6FF), Color(0xFF1D4ED8)],
                          ),
                          1,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SizedBox(
                        width: cardWidth,
                        child: _entrance(
                          const StatsCard(
                            icon: Icons.task_alt_rounded,
                            value: '28',
                            label: 'Completed Tasks',
                            colors: [Color(0xFFEFFCF4), Color(0xFF15803D)],
                          ),
                          2,
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 24),
              const Text(
                'Quick Actions',
                style: TextStyle(
                  color: Color(0xFF172554),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.9,
                children: [
                  _entrance(
                    FeatureCard(
                      icon: Icons.person_outline_rounded,
                      title: 'My Profile',
                      description: 'View personal and academic information.',
                      onTap: () => _showDetails(
                        'Muhammad Adeel',
                        'Display name: Adeel\n'
                            'Role: Software Engineering Student\n'
                            'University: Riphah International University, Islamabad\n'
                            'Current semester: 5th Semester\n'
                            'CGPA: 3.87',
                      ),
                    ),
                    0,
                  ),
                  _entrance(
                    FeatureCard(
                      icon: Icons.folder_outlined,
                      title: 'My Projects',
                      description: 'Explore software development projects.',
                      onTap: () => _showMessage('My Projects selected'),
                    ),
                    1,
                  ),
                  _entrance(
                    FeatureCard(
                      icon: Icons.code_rounded,
                      title: 'My Skills',
                      description:
                          'Explore programming and development skills.',
                      onTap: () => _showDetails(
                        'Skills & Interests',
                        'Skills: C++, Java, JavaScript, Dart, Flutter, React, '
                            'Next.js, Node.js\n\n'
                            'Interests: Software Development, Flutter, Dart, Web '
                            'Development, Full Stack Development',
                      ),
                    ),
                    2,
                  ),
                  _entrance(
                    FeatureCard(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      description: 'Customize your app.',
                      onTap: () => _showMessage('Settings selected'),
                    ),
                    3,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedNavIndex,
        height: 72,
        backgroundColor: Colors.white,
        indicatorColor: const Color(0xFFE0E7FF),
        onDestinationSelected: (index) {
          setState(() => _selectedNavIndex = index);
          const labels = ['Home', 'Explore', 'Notifications', 'Profile'];
          _showMessage('${labels[index]} selected');
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_outlined),
            selectedIcon: Icon(Icons.notifications_rounded),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
