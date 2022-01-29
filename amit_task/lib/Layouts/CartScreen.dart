import 'package:amit_task/Shared/Components/Components.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConditionalBuilder(
        condition: true,
        builder: (context) => Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) => buildCartItem(),
                  itemCount: 10,
                ),
              ),
              //Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          textStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {

                      },
                      child: Container(
                        height: 60.0,
                        alignment: Alignment.center,
                        child: Text(
                          'Clear Cart',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          textStyle: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          )),
                      onPressed: () {

                      },
                      child: Container(
                        height: 60.0,
                        alignment: Alignment.center,
                        child: Text(
                          'Go to Checkout',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        fallback: (context) => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
