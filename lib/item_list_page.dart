import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'model.dart';

class ItemListPage extends StatefulWidget {
  @override
  _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
  List<Item> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      print('File loaded successfully');
      final Map<String, dynamic> result = json.decode(response);
      if (result['success']) {
        items = List<Item>.from(
            result['data'].map((e) => Item.fromJson(e)).toList());
        print('Data parsed successfully');
      } else {
        print("Error: 'success' field is false");
      }
    } catch (e) {
      print('Error loading or parsing JSON: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Card(
          color: Color.fromARGB(255, 248, 210, 222),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: items
                      .map((e) => ListTile(
                            title: Text(e.name),
                            subtitle: Text('Value: ${e.value}'),
                          ))
                      .toList(),
                ),
        ),
      ),
    );
  }
}
