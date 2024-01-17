import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:pardillo_finalproject/services/product_page.dart';

class ProductService {
  final CollectionReference _productsCollection =
  FirebaseFirestore.instance.collection('products');
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;






  Stream<QuerySnapshot> getImageStream() {
    return _firestore.collection('imageCollection').snapshots();
  }

  Future<void> addProduct(Product product) async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        await _productsCollection.doc(product.id).set(product.toMap());
      } else {
        throw ('User is not authenticated.'); // Throw an error instead of just printing
      }
    } catch (e) {
      print('Error adding product: $e');
      throw e;
    }
  }

  Stream<List<Product>> getProductsStream() {
    return _productsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        try {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

          // Check for null values or use default values if a field is null
          String id = doc.id;
          String name = data['name'] ?? 'No Name';
          String description = data['description'] ?? 'No Description';
          String image = data['image'] ?? ''; // Set default value or handle accordingly
          double price = (data['price'] as num?)?.toDouble() ?? 0.0;
          String location = data['location'] ?? 'No Location';
          PostedByUser postedByUser =
          PostedByUser.fromMap(data['postedByUser'] ?? {});

          return Product(
            id: id,
            name: name,
            description: description,
            image: image,
            price: price,
            location: location,
            postedByUser: postedByUser,
          );
        } catch (e) {
          print('Error mapping product: $e');
          throw e;
        }
      }).toList();
    }).handleError((error) {
      print('Error fetching products: $error');
      throw error;
    });
  }

  Future<String> uploadImage(File imageFile) async {
    try {
      String imageId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      Reference storageReference =
      _storage.ref().child('product_images/$imageId.jpg');
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;

      if (taskSnapshot.state == TaskState.success) {
        String downloadUrl = await storageReference.getDownloadURL();
        return downloadUrl;
      } else {
        throw ('Image upload failed');
      }
    } catch (e) {
      print('Error uploading image: $e');
      throw e;
    }
  }
}
