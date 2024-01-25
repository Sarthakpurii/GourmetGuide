import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:gourmet/screens/categories-screen.dart';
import 'package:gourmet/screens/home-screen.dart';


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
        bodyLarge: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),
        // bodyMedium: TextStyle(color: Color(0xFFF05941)),
        bodyMedium: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),
        bodySmall: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),
        
      ),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 255, 255, 255),
        // color: Color(0xFFBE3144),
      ),
      appBarTheme:AppBarTheme(
        color: Color(0xFF22092C),
        elevation: 3,
        foregroundColor: Color.fromARGB(255, 240, 95, 73),
        titleTextStyle: GoogleFonts.philosopher(
          fontSize: 20,
          color: Color.fromARGB(255, 240, 95, 73),
        ),
        iconTheme: IconThemeData(color: Color(0xFF872341)),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFFF05941),
      ),
    ),


      // home: MealsScreen(title: 'Summer', meals: []),
      home: const HomeScreen(),
    )
  );
}
