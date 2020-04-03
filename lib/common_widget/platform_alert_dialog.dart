
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:jobs_seekers/common_widget/platform_widget.dart';

class PlatFormAlertDialog extends PlatformWidget {
  PlatFormAlertDialog({
    @required this.title,
   @required this.content,
    this.cancleActionText,
   @required this.defaultActionText
  }): assert(title !=null), assert
  (content != null),
        assert (defaultActionText !=null);



  final String title;
  final String content;
  final String cancleActionText;
  final String defaultActionText;


  Future<bool>show(BuildContext context)async{
    return Platform.isIOS
      ? await showCupertinoDialog<bool>(context: context,
        builder: (context)=>this)
    : await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context)=>this,
    );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    {
    }
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildActions(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text (title),
      content:Text (content) ,
      actions: _buildActions(context),
    );
  }
  List <Widget> _buildActions(BuildContext context){
    final action =<Widget>[];
    if (cancleActionText!=null){
      action.add(
          PlatformAlertDialogAction(
            child: Text(cancleActionText),
            onpressed: () => Navigator.of(context).pop(false),
          )
      );
    }
    action.add(
      PlatformAlertDialogAction(
        child: Text(defaultActionText),
        onpressed: () => Navigator.of(context).pop(true),
      )
    );
    return action;
  }

}
 class PlatformAlertDialogAction extends PlatformWidget{
   PlatformAlertDialogAction({this.child,
     this.onpressed});

   final Widget child;
  final VoidCallback onpressed;

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onpressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(
      child: child,
      onPressed: onpressed,
    );
  }


 }