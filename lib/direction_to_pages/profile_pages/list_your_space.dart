import 'package:flutter/material.dart';
import 'package:pardillo_finalproject/subscribe_person_pages/subscribe_page/subscribe_account.dart';

class ListYourSpace extends StatelessWidget {

  const ListYourSpace({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListYourSpace '),
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            // Add subtle box shadow for depth
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4.0)],
            // Change background color if desired
            // color: Colors.lightBlue[50],
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 8.0), // adjust top padding for image
            child: Column(
              children: [
                // Optional: Add relevant image behind text
                // Image.network(...),
                Text(
                  'Dive deeper into relaxation:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0), // emphasize first line
                ),
                Text(
                  'Upgrade your beach experience with our VIP subscription and '
                      'unlock exclusive perks, endless paradise, and escape the ordinary.',
                  textAlign: TextAlign.center, // center text in column
                ),
                // Optional: Add relevant icon after text
                // Icon(Icons.beach_access),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
          onPressed: () => _showSubscriptionPopup(context),
          child: const Icon(Icons.star),
        ),
      ),
    );
  }

  void _showSubscriptionPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Go Pro and unlock premium features!',
                  style: Theme.of(context).textTheme.headlineLarge
              ),

              const  SizedBox(height: 10),

              const Text('Get unlimited listings, advanced analytics,'
                  ' and priority support with our Pro subscription.'),

              const   SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const SubscribeAccount()),
                  );
                },
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Center(
                            child: Expanded(
                              child: Text(
                                "Subscribe now!",
                                style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.subscriptions,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
