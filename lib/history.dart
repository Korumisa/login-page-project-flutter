import 'package:flutter/material.dart';
import 'main.dart'; // Ensure this imports your main page
import 'menu.dart'; // Import the next page you want to navigate to

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
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Menu()),
              );
            },
          ),
        ],
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