import 'package:amit_task/HomeScreen.dart';
import 'package:amit_task/Layouts/LoginScreen.dart';
import 'package:amit_task/Layouts/SignUpScreen.dart';
import 'package:amit_task/Shared/Components/Components.dart';
import 'package:flutter/material.dart';

import 'CarouselSlider.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeScreen.scafoldkey.currentState!.openEndDrawer();
    return Container();
  }
}
