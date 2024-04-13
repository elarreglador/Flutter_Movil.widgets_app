import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.pink,
  Colors.black,
  Colors.amber,
  Colors.cyan,
  Colors.deepOrange,
  Colors.grey,
  Colors.indigo
];

class AppTheme {

  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }):
  assert (selectedColor >= 0,  
    "Selected color must be greaher than 0"),
  assert (selectedColor <= colorList.length, 
    "Selected color must be less or equal than ${colorList.length-1}");
  
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList [ selectedColor ],
    // Centra los titulos del AppBar
    appBarTheme: const AppBarTheme( centerTitle: true) 
  );

}