import 'package:flutter/material.dart';
import 'main.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Our History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
      ),
      body: Center(
        child: Text(
          'Under Maintenance',
          style: TextStyle(fontSize: 24, color: Colors.blueAccent),
        ),
      ),
    );
  }
}