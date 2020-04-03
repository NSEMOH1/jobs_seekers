import 'package:flutter/material.dart';
import 'package:jobs_seekers/common_widget/custom_raised_button.dart';

class FormSubmitButtom extends CustomRaisedButton{
  FormSubmitButtom({
    @required String text,
    VoidCallback onpressed,
}) : super(
    child: Text(
        text,
       style:TextStyle(color:Colors.white, fontSize: 24.0),
    ),
    height:44.0,
    color:Colors.indigo,
    borderRadius:4.0,
    onpressed: onpressed,
  );
}