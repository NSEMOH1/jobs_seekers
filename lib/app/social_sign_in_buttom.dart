
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jobs_seekers/common_widget/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton{
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onpressed,
  }) : super(
    child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
      Image.asset(assetName),

        Text(text,
      style: TextStyle(color: textColor,fontSize: 15.0),
        ),
        Opacity(
  opacity: 0.0,
  child: Image.asset(assetName),

  ),
  ],
  ),
    color:color,
    onpressed:onpressed,
  );
}
