import 'package:flutter/material.dart';
import 'package:personal_finances/src/navigator/routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.pushNamed(context, kHomeRoute));

    return Scaffold(
      body: Center(child: Text('splash')),
    );
  }
}