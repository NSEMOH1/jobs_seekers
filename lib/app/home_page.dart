
import 'package:flutter/material.dart';
import 'package:jobs_seekers/common_widget/platform_alert_dialog.dart';
import 'package:jobs_seekers/services/auth.dart';

class HomePage extends StatelessWidget {
  HomePage({@required this.auth, });

  final AuthBase auth;
  Future<void> _SignOut () async{
    try {
      await auth.signOut();

    } catch(e){
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context)async{
    final didRequestSignOut=await PlatFormAlertDialog(
      title: "Logout",
      content: "Are you sure that you want to logout?",
      cancleActionText: "Cancle",
      defaultActionText: "Logout",
    ).show(context);
    if (didRequestSignOut==true){
      _SignOut();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          FlatButton(
            child: Text("Logout", style: TextStyle(fontSize: 18.0,color: Colors.white),),
            onPressed:()=>_confirmSignOut(context),
          ),
        ],
      ),
    );
  }
}
