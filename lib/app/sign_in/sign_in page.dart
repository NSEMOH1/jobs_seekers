import 'package:flutter/material.dart';
import 'package:jobs_seekers/app/sign_in/email_sign_in_page.dart';
import 'package:jobs_seekers/app/social_sign_in_buttom.dart';
import 'package:jobs_seekers/app/sign_in_button.dart';
import 'package:jobs_seekers/services/auth.dart';




class SignInPage  extends StatelessWidget {
  SignInPage({@required this.auth,});
  final AuthBase auth;

  Future<void> _SignInAnonymously() async{
    try {
      await auth.signInAnonymously();
    } catch(e){
      print(e.toString());
    }
  }
  Future<void> _SignInAWithGoogle() async{
    try {
      await auth.signInWithGoogle();
    } catch(e){
      print(e.toString());
    }
  }
  Future<void> _SignInAWithFacebook() async{
    try {
      await auth.signInWithFacebook();
    } catch(e){
      print(e.toString());
    }
  }
  void _SignInWithEmail(BuildContext context){
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context)=>EmailSignInPage(auth: auth,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Jobs Seekers"),
        elevation: 2.0,
      ),
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text("Sign in",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w600,
          ),
          ),

          SizedBox(height: 48.0),
          SocialSignInButton(
            assetName: "asset/image/google.jpg",
           text: "Sign in with Google",
            textColor: Colors.black87,
            color: Colors.white,
            onpressed: _SignInAWithGoogle,
          ),
          SizedBox(height: 8.0),

          SocialSignInButton(
            assetName: "asset/image/Facebook-Logo.png",
            text: "Sign in with Facebook",
            textColor: Colors.white,
            color: Color(0xFF334D92),
            onpressed: _SignInAWithFacebook,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Sign in with Email",
            textColor: Colors.white,
            color: Colors.teal[700],
            onpressed: () => _SignInWithEmail(context),
          ),
          SizedBox(height: 8.0),
          Text(
            "or",
            style: TextStyle(fontSize: 14.0,color:Colors.black87),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),
          SignInButton(
            text: "Go Anonymous",
            textColor: Colors.black,
            color: Colors.lime[300],
            onpressed: _SignInAnonymously,
          ),

        ],

      ),
    );
  }
}