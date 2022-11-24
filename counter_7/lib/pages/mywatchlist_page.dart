import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/models/mywatchlist_model.dart';
import 'package:counter_7/pages/mywatchlist_detail.dart';

class Details {
  static late MineWatchList _getFields;
  static MineWatchList get getter => _getFields;
}

class WatchList extends StatefulWidget {
  const WatchList({Key? key}) : super(key: key);

  @override
  _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  Future<List<MineWatchList>> fetchwatchlist() async {
    var url = Uri.parse(
        'https://jsonplaceholder.typicode.com/todos?_start=0&_limit=10');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // decode the response into the json form
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // convert the json data into watchlist object
    List<MineWatchList> listwatchlist = [];
    for (var d in data) {
      if (d != null) {
        listwatchlist.add(MineWatchList.fromJson(d));
      }
    }
    return listwatchlist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Watchlist'),
        ),
        drawer: DrawerClass(),
        body: FutureBuilder(
            future: fetchwatchlist(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Watchlist kosong ngab",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                      ),
                      SizedBox(height: 8),
                    ],
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(
                                  "${snapshot.data![index].title}",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  ),
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: () {
                                    Details._getFields = snapshot.data![index];
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => WatchListDetails()),
                                    );
                                  },
                                  child: Text("Menuju Detail")
                                ),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}