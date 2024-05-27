import 'package:flutter/material.dart';

class TeacherScreen extends StatelessWidget {
  final String email;

  TeacherScreen({required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
      ),
      body: Center(
        child: Text(
          'Welcome, Teacher!\nEmail: $email',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
