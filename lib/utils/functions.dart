import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void nextPage(page, context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void newPage(page, context) {
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => page), (route) => false);
}

showToast(String message) {
  if (kDebugMode) {
    print(" \n \n Print: \n $message \n ");
  }
  Fluttertoast.showToast(
      msg: message,
      fontSize: 18,
      backgroundColor: Colors.deepOrange,
      textColor: Colors.white,
      gravity: ToastGravity.SNACKBAR,
      webPosition: 'center',
      toastLength: Toast.LENGTH_SHORT,
      timeInSecForIosWeb: 30);
}
