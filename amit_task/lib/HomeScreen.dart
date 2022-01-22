import 'package:amit_task/Layouts/ProductsScreen.dart';
import 'package:flutter/material.dart';
import 'Layouts/CategoriesScreen.dart';
import 'Layouts/LoginScreen.dart';
import 'Layouts/SignUpScreen.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Define List Objects from Screens
  List<Widget> screens = [
    ProductsScreen(),
    CategoriesScreen(),
    LoginScreen(),
    SignUpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[MyApp().getSelectedIndex()],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        currentIndex: MyApp().getSelectedIndex(),
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            MyApp().setSelectedIndex(index);
          });
        },
      ),
    );
  }
}
