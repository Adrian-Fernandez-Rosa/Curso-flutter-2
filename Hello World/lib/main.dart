import 'package:flutter/material.dart';
import 'package:hello_world/presentation/screens/counter/counter_functions_screen.dart';
// import 'package:hello_world/presentation/screens/counter/counter_screen.dart';

void main() {
  runApp(const myApp());
}

// ignore: camel_case_types
class myApp extends StatelessWidget {
  
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta debug

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue
       ),



      home:  const CounterFunctionsScreen()
    );
  }
}
