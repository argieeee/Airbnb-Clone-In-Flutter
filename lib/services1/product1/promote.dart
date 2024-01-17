// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// class DisplayImage extends StatelessWidget {
//   final String imageUrl;
//
//   DisplayImage({required this.imageUrl});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display Image from Firestore'),
//       ),
//       body: Center(
//         child: Image.network(imageUrl),
//       ),
//     );
//   }
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<DocumentSnapshot>(
//       stream: FirebaseFirestore.instance
//           .collection('uploads')
//           .doc('document_id')
//           .snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }
//         var data = snapshot.data!.data() as Map<String, dynamic>;
//         var imageUrl = data['image_url'];
//         return DisplayImage(imageUrl: imageUrl);
//       },
//     );
//   }
// }
