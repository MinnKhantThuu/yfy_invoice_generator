import 'package:flutter/material.dart';
import 'package:yfy_invoice_generator/screen/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YFY Invoice Generator',
      theme: ThemeData(
        fontFamily: 'Myanmar',
      ),
      home: const LoadingScreen(),
    );
  }
}

