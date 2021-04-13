import 'package:flutter/material.dart';

class Utils {
  static void navigateTo(BuildContext context, Widget page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  static void navigateToReplacement(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  static void showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context, String text) {
    final snackbar = SnackBar(content: Text(text));
    scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
