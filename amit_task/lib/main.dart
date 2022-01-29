import 'package:amit_task/HomeScreen.dart';
import 'package:amit_task/Layouts/LoginScreen.dart';
import 'package:amit_task/Shared/Cubit/AppCubit.dart';
import 'package:amit_task/Shared/Cubit/Observer.dart';
import 'package:amit_task/Shared/Network/Remote/DioHelper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Shared/Cubit/AppStates.dart';

void main() {
  BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
      await DioHelper.init();
      runApp(MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getProductssData(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Orange Task',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomeScreen(),
          //home: LoginScreen(),
        ),
      ),
    );
  }
}
