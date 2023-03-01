import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 2,
          foregroundColor: Colors.green,
          backgroundColor: Colors.white,
          title: const Text(
            'today',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          )),
    );
  }
}