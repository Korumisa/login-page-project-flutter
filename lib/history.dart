import 'package:flutter/material.dart';
import 'main.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Blank Page'),
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