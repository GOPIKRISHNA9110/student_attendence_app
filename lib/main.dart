import 'package:flutter/material.dart';

void main() {
  runApp(const StudentAttendanceApp());
}

class StudentAttendanceApp extends StatelessWidget {
  const StudentAttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Attendance App',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Attendance App'),
      ),
      body: const Center(
        child: Text(
          'Student Attendance',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}