import 'package:first_database/pages/home_page.dart';
import 'package:first_database/pages/results/result.dart';
import 'package:first_database/pages/sign_in.dart';
import 'package:first_database/pages/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("database");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        SignIn.id: (context) => SignIn(),
        SignUp.id: (context) => SignUp(),
        Results.id: (context) => Results(true),
      },
    );
  }
}
