import 'package:flutter/material.dart';
import 'screens/user_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APLIKASI SEDERHANA',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: UserListScreen(),
    );
  }
}
