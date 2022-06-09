import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

class AmigosScreen extends StatelessWidget {
  const AmigosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text('Proximamente',
            style: TextStyle(color: Colors.white, fontSize: 20)));
  }
}
