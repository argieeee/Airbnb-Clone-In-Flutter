import 'package:flutter/material.dart';

class Accessibility extends StatelessWidget {
  const Accessibility({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accessibility '),
      ),
      body: const Center(
        child: Text('Accessibility page!'),
      ),
    );
  }
}