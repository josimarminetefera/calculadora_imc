import 'package:calculadora_imc/screen/home_screen.dart';
import 'package:calculadora_imc/screen/principal_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepOrange, //cor inicial
          primaryColor: Color.fromARGB(255, 0, 0, 125)), //Cor principal do aplicativo
      debugShowCheckedModeBanner: false, //negocio que fica no canto direito
      home: HomeScreen(),
    );
  }
}

