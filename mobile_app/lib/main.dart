import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:di/di.dart' as di;

import 'src/navigator/routes.dart';
import 'src/ui/theme/style.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await di.init();

  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Finances',
      debugShowCheckedModeBanner: false,
      theme: kTheme,
      initialRoute: kSplashRoute,
      routes: kRoutes,
    );
  }
}