import 'package:amit_task/Layouts/MenuScreen.dart';
import 'package:amit_task/Shared/Cubit/AppCubit.dart';
import 'package:amit_task/Shared/Cubit/AppStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Shared/Components/Components.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static var scafoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scafoldkey,
          body: cubit.screens[cubit.navigationIndex],
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
            currentIndex: cubit.navigationIndex,
            selectedItemColor: Colors.red,
            onTap: (index) {
              if(index == 3){
                scafoldkey.currentState!.openEndDrawer();
              }
              cubit.bottomNavigationIndexChanged(index);
            },
          ),
          endDrawer: drawerBuilder(context),
        );
      },
    );
  }
}

