import 'package:first_database/pages/sign_up.dart';
import 'package:first_database/pages/strings.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Results extends StatefulWidget {
  static const String id = "result";

  bool? bul;

  Results(this.bul);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  String name = others().bx.get("firstName");
  String last = others().bx.get("lastName");
  String email = others().bx.get("login");
  String pass = others().bx.get("pass");

  @override
  Widget build(BuildContext context) {
    bool has = others().bor;
    return Scaffold(
      body: Center(
        child: text(widget.bul),
      ),
    );
  }

  text(have) {
    if (have) {
      return Text("$email \n$pass");
    } else {
      return Text("$name \n$last \n$email \n$pass");
    }
    ;
  }
}
