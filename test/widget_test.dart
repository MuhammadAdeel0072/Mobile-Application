// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/screens/dashboard_screen.dart';
import 'package:my_app/main.dart';

void main() {
  testWidgets('auth screens show DevFlow branding and navigate', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    expect(find.text('DevFlow'), findsOneWidget);
    expect(find.text('Welcome Back, Adeel'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.text('Continue with Apple'), findsOneWidget);
    expect(tester.takeException(), isNull);

    await tester.ensureVisible(find.text('Sign Up'));
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();
    expect(find.text('DevFlow'), findsOneWidget);
    expect(find.text('Create Account'), findsNWidgets(2));
    expect(find.text('Full Name'), findsOneWidget);
  });

  testWidgets('dashboard displays the personalized profile and sample stats', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(320, 640);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: DashboardScreen()));
    await tester.pumpAndSettle();
    expect(find.text('DevFlow'), findsOneWidget);
    expect(find.text('Adeel'), findsOneWidget);
    expect(find.text('Muhammad Adeel  ·  5th Semester'), findsOneWidget);
    expect(
      find.text('Riphah International University, Islamabad'),
      findsOneWidget,
    );
    expect(find.text('3.87'), findsOneWidget);
    expect(find.text('12'), findsOneWidget);
    expect(find.text('28'), findsOneWidget);
    expect(find.text('My Skills'), findsOneWidget);
    expect(
      find.text('Project and task figures are sample values, not live data.'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });
}
