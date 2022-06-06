import 'package:first_database/pages/results/result.dart';
import 'package:first_database/pages/sign_up.dart';
import 'package:first_database/pages/strings.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SignIn extends StatefulWidget {
  static const String id = 'in';

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  doSignIn() {
    String email = emailcontroller.text.toString().trim();
    String password = passwordcontroller.text.toString().trim();

    var box = Hive.box("database");
    box.put("login", email);
    box.put("pass", password);
  }

  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

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
                    onPressed: () {
                      setState((){
                        others().bor = true;
                      });
                      doSignIn();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Results(true),
                        ),
                      );
                    },
                    child: Text("Sign In"),
                    color: Colors.green,
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
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text("Sign Up"),
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
