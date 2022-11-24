import 'package:flutter/material.dart';
import 'package:counter_7/formbudget.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/budgetdata.dart';
import 'package:counter_7/pages/mywatchlist_page.dart';

class DrawerClass extends StatefulWidget {
  DrawerClass({Key? key}) : super(key: key);

  @override
  _DrawerClassState createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // other children,
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Counter"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Form Budget"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FormBudgetPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Data Budget"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DataBudgetPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.watch_later),
            title: Text("My Watchlist"),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WatchList()),
              );
            },
          ),
        ],
      ),
    );
  }
}