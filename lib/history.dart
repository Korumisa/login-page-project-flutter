import 'package:flutter/material.dart';
import 'main.dart';
import 'menu.dart';
import 'detail_page.dart';

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
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Set card dimensions to be smaller
          double cardHeight = 25; // Set card height
          double cardWidth = 50;  // Set card width

          // List of cards with different content
          final List<Map<String, String>> cardData = [
            {
              'title': 'Worldwide Company',
              'description': 'Leading global supplier of various products.',
              'image': 'assets/MM1.jpg',
            },
            {
              'title': 'Innovative Solutions',
              'description': 'Pioneering new technologies for the future.',
              'image': 'assets/MM2.jpg',
            },
            {
              'title': 'Customer Satisfaction',
              'description': 'Committed to providing the best customer service.',
              'image': 'assets/MM3.jpg',
            },
            {
              'title': 'Sustainable Practices',
              'description': 'Implementing eco-friendly methods in our operations.',
              'image': 'assets/MM4.jpg',
            },
          ];

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of cards in a row
              childAspectRatio: cardWidth / cardHeight, // Aspect ratio of the cards
            ),
            padding: const EdgeInsets.all(8.0),
            itemCount: cardData.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailPage(index: index)),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 4,
                    child: Container(
                      width: cardWidth,
                      height: cardHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              cardData[index]['image']!, // Get image from data
                              height: 60, // Set image height
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 4), // Space between image and title
                          Text(
                            cardData[index]['title']!, // Get title from data
                            style: const TextStyle(
                              fontSize: 24, // Set title font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2), // Space between title and description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              cardData[index]['description']!, // Get description from data
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15, color: Colors.black54), // Set description font size
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
