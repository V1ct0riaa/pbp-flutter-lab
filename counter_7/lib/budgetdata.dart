import 'package:counter_7/formbudget.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _DataBudgetPageState();
}

class _DataBudgetPageState extends State<DataBudgetPage> {
  int indexLength = FormData.getLength();
  List<String> judul = FormData.getJudul();
  List<String> nominal = FormData.getNominal();
  List<String> budgeting = FormData.getBudgeting();

  @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Data Budget'),
            ),
            drawer: DrawerClass(),
            body: Form(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: const Text('Data Budget')),
                        for (int i = 0; i < indexLength; i++) ListView(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          shrinkWrap: true,
                          children: [
                            SizedBox(height: 20),
                            // TODO: Munculkan informasi yang didapat dari form
                            Text( 
                              judul[i],
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              nominal[i],
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              budgeting[i],
                              textAlign: TextAlign.right,
                            ),
                          ],
                        ),
                      ]
                  ),
                ),
              ),
            ),
        );
    }
}