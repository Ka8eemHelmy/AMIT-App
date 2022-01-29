import 'package:amit_task/Layouts/SignUpScreen.dart';
import 'package:amit_task/Shared/Components/Components.dart';
import 'package:amit_task/Shared/Cubit/AppCubit.dart';
import 'package:amit_task/Shared/Cubit/AppStates.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'CarouselSlider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  //Define Controllers of Email and Password
  var emailController = TextEditingController();
  var passController = TextEditingController();

  //Define Key of Form
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  //to animate the Scroll to be Bouncing
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ComplicatedImageDemo(),
                          // Image(
                          //   width: 250.0,
                          //   height: 250.0,
                          //   image: NetworkImage(
                          //       "https://www.amit-learning.com/assets/logo.png"),
                          // ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            //To prevent user to Enter any thing else Numbers and Characters and @ .
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                RegExp("[0-9a-zA-Z@a-zA-Z.a-zA-Z]"),
                              ),
                            ],
                            //to Validate Email input
                            validator: (value) {
                              if (value!.replaceAll(' ', '').isEmpty) {
                                return "Please, Enter Your Email";
                              }
                              //We Can validate all characters and ask the user to enter valid Email if he enter some characters not valid
                              // else if (value.contains('+')||value.contains('/')){
                              //   return "Please, Enter Valid Email";
                              // }
                              return null;
                            },
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please, Enter Your Password";
                              }
                              return null;
                            },
                            maxLength: 8,
                            controller: passController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: AppCubit.get(context).passIcon,
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              ),
                              suffixIcon: IconButton(
                                icon: AppCubit.get(context).passIcon
                                    ? Icon(Icons.remove_red_eye)
                                    : Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  AppCubit.get(context).passwordSuffixChanged(
                                      !AppCubit.get(context).passIcon);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: 200.0,
                            child: ConditionalBuilder(
                              condition: state is! LoginLoading,
                              builder: (context) => MaterialButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    print(
                                      "Email : ${emailController.text} Password : ${passController.text}",
                                    );
                                    AppCubit.get(context).userLogin(emailController.text, passController.text);
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                color: Colors.red,
                                textColor: Colors.white,
                              ),
                              fallback: (context) => Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          TextButton(
                            child: Text(
                              "Go Register",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              // setState(() {
                              //   //rebuild HomeScreen but we change Navigator Index to go to Login
                              //   const MyApp().setSelectedIndex(3);
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => HomeScreen(),
                              //     ),
                              //   );
                              // });
                              navigateTo(context, SignUpScreen());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
