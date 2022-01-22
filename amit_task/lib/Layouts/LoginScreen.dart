import 'package:amit_task/HomeScreen.dart';
import 'package:amit_task/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Define Controllers of Email and Password
  var emailController = TextEditingController();
  var passController = TextEditingController();

  //Define Key of Form
  var formKey = GlobalKey<FormState>();

  //Define of State of Suffix Icon of Password
  bool passIcon = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  Image(
                    width: 250.0,
                    height: 250.0,
                    image: NetworkImage(
                        "https://www.amit-learning.com/assets/logo.png"),
                  ),
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
                    obscureText: passIcon,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      suffixIcon: IconButton(
                        icon: passIcon
                            ? Icon(Icons.remove_red_eye)
                            : Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {
                          setState(() {
                            passIcon = !passIcon;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 200.0,
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(
                              "Email : ${emailController.text} Password : ${passController.text}");
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
                  ),
                  TextButton(
                    child: Text(
                      "Go Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        //rebuild HomeScreen but we change Navigator Index to go to Login
                        const MyApp().setSelectedIndex(3);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
