import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/ejercicio.dart';

import '../theme/app_theme.dart';

class EjercicioDetailScreen extends StatelessWidget {
  EjercicioDetailScreen({Key? key, required this.ejercicio}) : super(key: key);

  EjercicioElement ejercicio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: AppTheme.primaryBlue,
          title: Text('Ejercicio: '+ejercicio.name),
          centerTitle: true,
        ),
      ),
      backgroundColor: AppTheme.primaryDarkBlue,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(ejercicio.name,style: TextStyle(color: Colors.white,fontSize: 24),),
        ),
        const Padding(
          padding: EdgeInsets.only(top:16.0,right: 16,left: 16, bottom: 8),
          child: Text('Grupos musculares que involucra:',style: TextStyle(color: Colors.white,fontSize: 20),),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:16.0,right: 16,left: 16),
          child: ListView.builder(
              itemCount: ejercicio.muscle.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text(ejercicio.muscle[index],style: TextStyle(color: Colors.white,fontSize: 18),);
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image(
            image: AssetImage(ejercicio.url),
            width: 500,
            height: 250,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Consejito: '+ejercicio.tip,style: TextStyle(color: Colors.white,fontSize: 14),),
        ),
      ]),
    );
  }
}
