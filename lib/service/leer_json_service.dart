import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/models.dart';

class LeerJsonService extends ChangeNotifier {
  Future<Ejercicio> fetchEjercicio() async {
    final String response =
        await rootBundle.loadString('assets/ejercicios.json');
    return Ejercicio.fromJson(json.decode(response));
  }
}
