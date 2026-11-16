import 'package:flutter/material.dart';
import 'screens/student_dashboard.dart';

class StudentDashboardApp extends StatelessWidget {
  const StudentDashboardApp({super.key});

  static const _accent = Color(0xFF8A76D8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _accent,
          brightness: Brightness.light,
        ).copyWith(surface: Colors.white),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const StudentDashboard(),
    );
  }
}
