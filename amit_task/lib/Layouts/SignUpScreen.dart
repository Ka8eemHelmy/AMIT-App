import 'package:amit_task/main.dart';
import 'package:flutter/material.dart';
import '../HomeScreen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //Define Controllers of Email and Password
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();

  //Define Key of Form
  var keyForm = GlobalKey<FormState>();

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
              key: keyForm,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "name is Empty";
                      }
                      return null;
                    },
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: "Name",
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
                        return "Email is Empty";
                      }
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
                        return "Password is Empty";
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
                        if (keyForm.currentState!.validate()) {
                          print(emailController.text);
                          print(nameController.text);
                          print(passController.text);
                        }
                        print(
                            "Name : ${nameController.text}, Email : ${emailController.text}, Password : ${passController.text}");
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Have an Account ?",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "Go Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        //rebuild HomeScreen but we change Navigator Index to go to SignUp
                        const MyApp().setSelectedIndex(2);
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
