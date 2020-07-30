import 'package:flutter/material.dart';

import 'src/navigator/routes.dart';
import 'src/ui/theme/style.dart';
 
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