import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/promote_resort.dart';

void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Listings(),
  ),
);

class Listing {
  final String title;
  final String description;

  Listing({required this.title, required this.description});
}

class Listings extends StatefulWidget {
  const Listings({Key? key}) : super(key: key);

  @override
  _ListingsState createState() => _ListingsState();
}

class _ListingsState extends State<Listings> {
  final List<Listing> listings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Listings",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _navigateToAddListing();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Listings",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listings.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(listings[index].title),
                      subtitle: Text(listings[index].description),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAddListing() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PromoteResort(),
      ),
    );

    if (result != null && result is Listing) {
      setState(() {
        listings.add(result);
      });
    }
  }
}

// class AddListingPage extends StatelessWidget {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Listing"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: titleController,
//               decoration: const InputDecoration(
//                 labelText: 'Title',
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: descriptionController,
//               decoration: const InputDecoration(
//                 labelText: 'Description',
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 final newListing = Listing(
//                   title: titleController.text,
//                   description: descriptionController.text,
//                 );
//                 Navigator.pop(context, newListing);
//               },
//               child: const Text('Add Listing'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
