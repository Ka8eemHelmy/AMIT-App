import 'package:amit_task/Shared/Components/Components.dart';
import 'package:amit_task/Shared/Cubit/AppCubit.dart';
import 'package:amit_task/Shared/Cubit/AppStates.dart';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! GetCategoriesDataLoading,
          builder: (context) => Container(
            color: Colors.grey[300],
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        //to animate the Scroll to be Bouncing
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                        childAspectRatio: 1 / 0.7,
                        children: List.generate(
                          AppCubit.get(context).categoriesList.length,
                          (index) => InkWell(
                            child: buildCategoryItem(
                                AppCubit.get(context).categoriesList[index]),
                            onTap: () {
                              print(
                                  'Cat : ${AppCubit.get(context).categoriesList[index].id}');
                              AppCubit.get(context).getCategoryProducts(AppCubit.get(context).categoriesList[index].id);
                              AppCubit.get(context).bottomNavigationIndexChanged(0);
                            },
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {
                        AppCubit.get(context).toggleProduct(true);
                        AppCubit.get(context).bottomNavigationIndexChanged(0);
                      },
                      child: Container(
                        height: 60.0,
                        alignment: Alignment.center,
                        child: Text(
                          'All Products',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
