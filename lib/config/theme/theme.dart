import 'package:flutter/material.dart';
import 'package:medical_management_app/config/resources/resources.dart';

final _border = UnderlineInputBorder(
  borderSide: BorderSide(color: MedicalManagementColors.accent),
);
final lightTheme = ThemeData(
    primaryColor: MedicalManagementColors.primary,
    accentColor: MedicalManagementColors.accent,
    textTheme: TextTheme().apply(displayColor: MedicalManagementColors.primaryText, bodyColor: MedicalManagementColors.primaryText).copyWith(
          headline6: TextStyle(color: MedicalManagementColors.primaryText),
        ),
    iconTheme: IconThemeData(color: MedicalManagementColors.accent),
    primaryIconTheme: IconThemeData(color: MedicalManagementColors.accent),
    textSelectionColor: MedicalManagementColors.primary,
    cursorColor: MedicalManagementColors.primary,
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: Sizes.padding),
      labelStyle: TextStyle(color: MedicalManagementColors.primaryText, fontWeight: FontWeight.bold),
      border: _border,
      // enabledBorder: _border,
      focusedBorder: _border,
    ),
    buttonTheme: ButtonThemeData(
      shape: StadiumBorder(),
      minWidth: double.infinity,
      padding: EdgeInsets.all(Sizes.padding),
      buttonColor: MedicalManagementColors.accent,
      textTheme: ButtonTextTheme.primary,
    ));
