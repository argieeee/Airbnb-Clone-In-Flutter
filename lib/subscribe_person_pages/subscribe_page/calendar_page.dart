import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/widgets/select_data_widget.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calendar(),
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
          "Calendar",
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
    );
  }
}
