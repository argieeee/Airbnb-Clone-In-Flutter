import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchButton '),
      ),
      body: const Center(
        child: Text('SearchButton page!'),
      ),

    );
  }
}