import 'package:flutter/material.dart';
import 'package:counter_7/pages/mywatchlist_page.dart';
import '../drawer.dart';

class WatchListDetails extends StatefulWidget {
  WatchListDetails({Key? key}) : super(key: key);

  @override
  State<WatchListDetails> createState() => WatchListStateDetails();
}

class WatchListStateDetails extends State<WatchListDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist Details'),
        ),
        drawer: DrawerClass(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title : " + Details.getter.title + " | Completion : " + Details.getter.completed.toString(),
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back", style: const TextStyle(fontSize: 18)),
            )
          ],
        ),
    );
  }
}