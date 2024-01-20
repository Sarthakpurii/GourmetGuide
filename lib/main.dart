import 'package:flutter/material.dart';
import 'package:gourmet/screens/categories-screen.dart';

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData(
      primaryColor: const Color(0xFF22092C),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF872341),
        textTheme: ButtonTextTheme.primary,
      ),
      scaffoldBackgroundColor: const Color(0xFF22092C),
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: Color(0xFFBE3144)),
        bodyLarge: TextStyle(color: Colors.white),
        // bodyMedium: TextStyle(color: Color(0xFFF05941)),
        bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 255, 255, 255),
        // color: Color(0xFFBE3144),
      ),
      appBarTheme:const AppBarTheme(
        color: Color(0xFF22092C),
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF872341)),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFF05941),
      ),
    ),


      // home: MealsScreen(title: 'Summer', meals: []),
      home: CategoriesScreen(),
    )
  );
}