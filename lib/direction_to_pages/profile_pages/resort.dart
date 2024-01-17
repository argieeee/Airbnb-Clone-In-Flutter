import 'package:flutter/material.dart';

class Resort extends StatelessWidget {
  const Resort({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resort  '),
      ),
      body: const Center(
        child: Text('hello sir!'),
      ),
    );
  }
}