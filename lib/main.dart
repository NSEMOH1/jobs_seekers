import 'package:flutter/material.dart';
import 'package:jobs_seekers/app/landing_page.dart';
import 'package:jobs_seekers/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tracker",
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: LandingPage(
        auth: Auth(),
      ),
      color: Colors.white,

    );
  }
}


