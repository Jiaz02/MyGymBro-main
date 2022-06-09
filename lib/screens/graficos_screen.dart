import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

class GrafficsScreen extends StatelessWidget {
  const GrafficsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.primaryDarkBlue,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            backgroundColor: AppTheme.primaryBlue,
            title: const Text('My Gym Bro'),
            centerTitle: true,
          ),
        ),
        body: Center(
            child: Text('Proximamente',
                style: TextStyle(color: Colors.white, fontSize: 20))));
  }
}
