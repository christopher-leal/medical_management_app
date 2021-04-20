import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static Future navigateTo(BuildContext context, Widget page) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  static void navigateToReplacement(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => page));
  }

  static void showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, BuildContext context, String text) {
    final snackbar = SnackBar(content: Text(text));
    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  static String dateWithoutTime(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(date);
    return formatted;
  }

  static String formatDate({String string, DateTime datetime}) {
    if (string != null) {
      DateTime dt0 = DateTime.parse(string);
      return DateFormat.yMMMMd('es_MX').format(dt0);
    } else if (datetime != null) {
      return DateFormat.yMMMMd('es_MX').format(datetime);
    }
    return "";
  }

  static String formatDateNumbers({String string, DateTime datetime}) {
    if (string != null) {
      DateTime dt0 = DateTime.parse(string);
      return DateFormat('d MMM y', 'es_MX').format(dt0);
    }

    return DateFormat('d MMM y', 'es_MX').format(datetime);
  }

  static void dismissKeyboard(BuildContext context) {
    FocusScopeNode cFocus = FocusScope.of(context);
    if (!cFocus.hasPrimaryFocus) {
      cFocus.unfocus();
    }
  }
}
