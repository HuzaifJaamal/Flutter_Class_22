import 'package:flutter/material.dart';
import 'package:flutter_class_22/login/login_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginViewState(),
      ),
    );
  }
}
