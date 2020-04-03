import 'dart:ffi';

import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  CustomRaisedButton ({
    this.child,
    this.color,
    this.borderRadius:16.0,
    this.height:50.0,
    this.onpressed,
  });

    final Widget child;
  final Color color;
  final double borderRadius;
  final double height;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context)
  { return SizedBox(
    height: height,
    child: RaisedButton(
      child: child,
      color: color,
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius),)
      ),
      onPressed: onpressed,

      ),
  );
    return Container();
  }
}
