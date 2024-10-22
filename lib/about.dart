import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('About Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'About Korumisa App',
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
            const SizedBox(height: 20),
            const Text(
              'This application is used to make it easier for you to manage your daily schedule. It is developed by Korumisa Inc. and is available for free on the App Store and Google Play.',
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Back',
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 255, 255, 255) ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}