import 'package:flutter/material.dart';


const scaffoldBackgroundColor = Colors.white;
const colorSeed = Colors.blueAccent;

class AppTheme {

  ThemeData getTheme() => ThemeData(

    useMaterial3: true,
    //! Here you can choose to create your own colorScheme or use ColorScheme.fromSeed and let Flutter take care of creating the complete colorScheme.
    colorSchemeSeed: colorSeed, 

    // Global Scaffold Background Color
    scaffoldBackgroundColor: scaffoldBackgroundColor,

  );

}