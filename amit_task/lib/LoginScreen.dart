import 'package:amit_task/main.dart';
import 'package:flutter/material.dart';

import 'SignUpScreen.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
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
                    controller: passController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye_outlined),
                        onPressed: () {},
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
                        print("Email : ${emailController.text} Password : ${passController.text}");
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
                      const MyApp().setSelectedIndex(1);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_to_photos_rounded),
            label: 'SignUp',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About AMIT',
          ),
        ],
        currentIndex: MyApp().getSelectedIndex(),
        selectedItemColor: Colors.red,
        onTap: (index) {
          MyApp().setSelectedIndex(index);
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    index == 1 ? SignUpScreen() : LoginScreen()),
          );
        },
      ),
    );
  }
}
