

class Product {
  final String id;
  final String name;
  final String description;
  final String image; // Using a single string for the image URL
  final double price;
  final String location;
  final PostedByUser postedByUser;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image, // Updated to a single string for the image URL
    required this.price,
    required this.location,
    required this.postedByUser,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '', // Mapping the 'image' field to a single string
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      location: map['location'] ?? '',
      postedByUser: PostedByUser.fromMap(map['postedByUser'] ?? {}),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image, // Storing the image URL as a single string
      'price': price,
      'location': location,
      'postedByUser': postedByUser.toMap(),
    };
  }
}

class PostedByUser {
  final String uid;
  final String email;

  PostedByUser({
    required this.uid,
    required this.email,
  });

  factory PostedByUser.fromMap(Map<String, dynamic> map) {
    return PostedByUser(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
    };
  }
}
