import 'package:flutter/material.dart';

const colorList = <Color>[
  Color.fromARGB(255, 0, 140, 255),
  Color.fromARGB(255, 253, 0, 0),
  Color.fromARGB(255, 0, 255, 8),
  Color.fromARGB(255, 255, 230, 0),
  Colors.black,
  Colors.grey,
];

class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  AppTheme({
    this.isDarkMode = false,
    this.selectedColor = 0
  }):
  assert (selectedColor >= 0,  
    "Selected color must be greaher than 0"),
  assert (selectedColor <= colorList.length, 
    "Selected color must be less or equal than ${colorList.length-1}");
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    //modo oscuro
    brightness: isDarkMode? 
      Brightness.dark: 
      Brightness.light,
    colorSchemeSeed: colorList [ selectedColor ],
    // Centra los titulos del AppBar
    appBarTheme: const AppBarTheme( centerTitle: true) 
  );

}