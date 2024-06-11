import 'package:flutter/material.dart';
import 'store_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        primarySwatch: Colors.red,
      ),
      home: StoreList(),
    );
  }
}