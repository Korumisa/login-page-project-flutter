import 'package:flutter/material.dart';
import 'history.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Our Menu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
              Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const History()),
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