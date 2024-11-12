import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Light blue background for contrast
      appBar: AppBar(
        title: Text('Detail Page #$index'),
        backgroundColor: Colors.blue[800], // Dark blue AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Image.asset(
                  'assets/MM.jpg', // Example image
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  // Placeholder if image is not found
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      alignment: Alignment.center,
                      child: const Text(
                        'Image not available',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Item #$index',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900], // Darker blue for title
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Discover more details about this item, including its unique features and history.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey[700], // Medium blue-grey for description
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800], // Dark blue for section titles
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.',
                      style: TextStyle(fontSize: 16, color: Colors.black54),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Features:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800], // Dark blue for section titles
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...List.generate(3, (featureIndex) => 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Feature ${featureIndex + 1}: Detailed description of feature goes here.',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      )
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Harga:',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800], // Dark blue for section titles
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(3, (featureIndex) => 
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Harga ${featureIndex + 1}: [Your Price Here]', 
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      )
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Action when button is pressed
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Button Pressed for Item #$index')),
                        );
                      },
                      child: const Text('Take Action'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
