import 'package:flutter/material.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Wishlists(),
  ),
);

class Wishlists extends StatefulWidget {
  const Wishlists({Key? key}) : super(key: key);

  @override
  _WishlistsState createState() => _WishlistsState();
}

class _WishlistsState extends State<Wishlists> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Wishlists",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Add functionality for edit icon here
            },
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create your first wishlist",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('As you search, tap'
                ' the heart icon to save'
                'your favorite beaches and Experiences'
                'to a wishlist.',
              style: TextStyle(
              fontSize: 16,
            ),

                ),

            // Add your wishlist items here
          ],
        ),
      ),
    );
  }
}
