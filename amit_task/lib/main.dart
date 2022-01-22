import 'package:flutter/material.dart';
import 'HomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //Index of Button Navigator
  static int _selectedIndex = 2;

  //Getter of _selectedIndex
  int getSelectedIndex() {
    return _selectedIndex;
  }

  //Setter of _selectedIndex
  void setSelectedIndex(num) {
    _selectedIndex = num;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Orange Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
