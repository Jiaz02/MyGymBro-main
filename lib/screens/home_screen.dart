import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/service/service.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final rutinaService = Provider.of<RutinaService>(context);

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
        bottomNavigationBar: CurvedNavigationBar(
          items: const <Widget>[
            Icon(Icons.people_sharp, size: 30),
            Icon(Icons.list_alt_rounded, size: 30),
            Icon(Icons.dashboard, size: 30),
            Icon(Icons.power, size: 30),
            Icon(Icons.person, size: 30),
          ],
          index: _selectedIndex,
          backgroundColor: AppTheme.primaryDarkBlue,
          onTap: _onItemTapped,
        ),
        body: Center(child: AppRoutes.bottomMenuOption[_selectedIndex].screen));
  }
}
