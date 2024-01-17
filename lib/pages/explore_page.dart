import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/constant/color.dart';
import 'package:pardillo_finalproject/models/booking_details_screen.dart';
import 'package:pardillo_finalproject/services/product_page.dart';
import 'package:pardillo_finalproject/services1/product1/product_service.dart';
import 'package:pardillo_finalproject/widgets/property_type_list.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ),
);

class HomeScreen extends StatefulWidget {
  const HomeScreen
      ({Key? key,
  }) : super(key: key);




  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ProductService _productService = ProductService();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 128,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: appBlack.withOpacity(0.1),
                blurRadius: 1.0,
                spreadRadius: 1.0,
                offset: const Offset(0.0, 1.0),
              )
            ],
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: PropertyTypeList(),
              ),
              Positioned(
                right: 16.0,
                top: 20.0,
                child: IconButton(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    shape: const CircleBorder(
                      side: BorderSide(color: appGrey, width: 1.0),
                    ),
                  ),
                  icon: const Icon(Icons.tune),
                ),
              ),
              Positioned(
                left: 16.0,
                right: 72.0,
                top: 20.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingDetailsScreen(),
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'planning',

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),

                      decoration: BoxDecoration(
                        color: appWhite,
                        border: Border.all(color: appGrey, width: 1.0),
                        borderRadius: BorderRadius.circular(32.0),
                        boxShadow: [
                          BoxShadow(
                            color: appGrey.withOpacity(0.5),
                            blurRadius: 8.0,
                            spreadRadius: 8.0,
                            offset: const Offset(0, 4.0),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Where to?',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      body: StreamBuilder<List<Product>>(
        stream: _productService.getProductsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching data'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          } else {
            final products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Price: \$${product.price.toString()}'),
                      Image.network(
                        product.image,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  ImageProvider<Object> _getImageProvider(String imagePath) {
    if (imagePath.startsWith('http')) {
      return NetworkImage(imagePath);
    } else if (imagePath.startsWith('assets/')) {
      return AssetImage(imagePath);
    } else {
      // Assuming imagePath is a local cache path
      String relativePath = imagePath.split('/cache/').last;
      return AssetImage(relativePath);
    }
  }


  // Function to build individual scrollable app bar item
  Widget _buildScrollableAppBarItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          // Implement action on tap for each scrollable app bar item
        },
        child: Text(text),
      ),
    );
  }
}
