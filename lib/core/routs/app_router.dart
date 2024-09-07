import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Future<void> normal(context, page) async {
    Navigator.push(
        context,
        Platform.isAndroid
            ? MaterialPageRoute(builder: (context) => page)
            : CupertinoPageRoute(builder: (context) => page));
  }

  static Future<void> closeOthers(context, page) async {
    Navigator.pushAndRemoveUntil(
        context,
        Platform.isAndroid
            ? MaterialPageRoute(builder: (context) => page)
            : CupertinoPageRoute(builder: (context) => page),
        (route) => false);
  }


  static Future<void> pop<T extends Object?>(BuildContext context,
      [T? result]) async {
    Navigator.of(context).pop<T>(result);
  }

}
