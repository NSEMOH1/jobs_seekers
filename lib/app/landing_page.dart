
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jobs_seekers/app/home_page.dart';
import 'package:jobs_seekers/app/sign_in/sign_in%20page.dart';
import 'package:jobs_seekers/services/auth.dart';

class LandingPage extends StatelessWidget {
  LandingPage({@required this.auth});
  final AuthBase auth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream:auth.onAuthStateChanged,
      builder: (context,snapshot){
        if (snapshot.connectionState==ConnectionState.active) {
          User user=snapshot.data;
          if (user == null) {
            return SignInPage(
              auth:auth,

            );
          }
          return HomePage(
            auth:auth,

          );
        } else{
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),

            ),
          );
        }
      }
    );

  }
}