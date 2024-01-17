import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pardillo_finalproject/services/product_page.dart';
import 'package:pardillo_finalproject/services1/product1/product_service.dart';
import 'package:pardillo_finalproject/singupPages/homePage.dart';

class PromoteResort extends StatefulWidget {
  const PromoteResort({Key? key}) : super(key: key);

  @override
  _PromoteResortState createState() => _PromoteResortState();
}

class _PromoteResortState extends State<PromoteResort> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _image;
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  late ProductService _productService;

  @override
  void initState() {
    super.initState();
    _productService = ProductService();
  }

  Future<void> _addImageField() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = image;
      });
    }
  }

  void _submitResort() {
    final String name = _nameController.text;
    final String description = _descriptionController.text;
    final String? imageUrl = _image?.path;
    final String priceText = _priceController.text.trim();
    final String location = _locationController.text;

    if (name.isEmpty || description.isEmpty || imageUrl == null || priceText.isEmpty || location.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }

    if (double.tryParse(priceText) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid price'),
        ),
      );
      return;
    }

    final double price = double.parse(priceText);

    final PostedByUser user = PostedByUser(uid: 'user123', email: 'example@example.com');

    final Product newResort = Product(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      description: description,
      image: imageUrl,
      price: price,
      location: location,
      postedByUser: user,
    );

    _productService.addProduct(newResort).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Resort added to Firestore!'),
        ),
      );
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add resort: $error'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promote Resort'),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Add functionality for "Complete your listing" button
            },
            child: const Text('Question?'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const SizedBox(height: 20),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Start a new listing',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Resort Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              if (_image != null) Text(_image!.path), // Display picked image path
              ElevatedButton(
                onPressed: _addImageField,
                child: const Text('Add Image Field'),
              ),
              TextField(
                controller: _priceController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(labelText: 'Price'),
              ),
              TextField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
              ElevatedButton(
                onPressed: _submitResort,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

