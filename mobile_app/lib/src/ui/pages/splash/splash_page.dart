import 'package:flutter/material.dart';
import 'package:application/application.dart';
import 'package:presentation_core/presentation.dart';
import 'package:di/di.dart';

import '../../../navigator/routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SplashBloc>(
        create: (_) => SplashBloc(g()),
        child: BlocListener<SplashBloc, bool>(
          listener: (_, result) => Navigator.pushNamed(context, kHomeRoute),
          child: Center(
            child: Text('lindo splash :D'),
          ),
        ),
      ),
    );
  }
}
