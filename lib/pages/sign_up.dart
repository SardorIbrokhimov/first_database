import 'package:first_database/pages/results/result.dart';
import 'package:first_database/pages/sign_in.dart';
import 'package:first_database/pages/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignUp extends StatefulWidget {
  static const String id = "up";

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var box = Hive.box("database");

  doSignUp() {
    String first = firstName.text.toString().trim();
    String last = lastName.text.toString().trim();
    String email = emailcontroller.text.toString().trim();
    String password = passwordcontroller.text.toString().trim();

    box.put("login", email);
    box.put("pass", password);
    box.put("firstName", first);
    box.put("lastName", last);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: Container(
          margin: EdgeInsets.only(top: 250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: firstName,
                decoration: InputDecoration(
                  hintText: "First Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: lastName,
                decoration: InputDecoration(
                  hintText: "Last Name",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    child: Text("Sign Up"),
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        others().bor = false;
                      });
                      doSignUp();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Results(false),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                    child: Text("Sign In"),
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
