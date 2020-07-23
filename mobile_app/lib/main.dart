import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finances',
      debugShowCheckedModeBanner: false,
      theme: theme,
      initialRoute: homeRoute,
      routes: routes,
    );
  }
}