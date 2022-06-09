import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/models.dart';

import 'package:http/http.dart' as http;

class RutinaService extends ChangeNotifier {
  final String _baseUrl =
      'mygymbro-f072a-default-rtdb.europe-west1.firebasedatabase.app';

  final controller = Get.find<Listas>();

  final storage = FlutterSecureStorage();

  bool isLoading = true;

  bool isSaving = false;

  RutinaService() {
    this.loadRutinas();
    this.loadPr();
  }

  Future loadRutinas() async {
    final url = Uri.https(_baseUrl, 'rutinas.json');
    final resp = await http.get(url);

    final String user = await storage.read(key: 'uid') ?? '';

    print('+' + user);
    final Map<String, dynamic> rutinasMap = json.decode(resp.body);

    rutinasMap.forEach((key, value) {
      final tempRutina = Rutina.fromMap(value);
      tempRutina.id = key;
      if (tempRutina.idUser == user) {
        controller.rutinasList.add(tempRutina);
      }
    });
  }

  Future loadPr() async {
    final url = Uri.https(_baseUrl, 'pr.json');
    final resp = await http.get(url);
    final String user = await storage.read(key: 'uid') ?? '';

    final Map<String, dynamic> prMap = json.decode(resp.body);

    print('-' + user);

    prMap.forEach((key, value) {
      final tempPr = Pr.fromMap(value);
      tempPr.id = key;
      if (tempPr.idUser == user) {
        controller.prList.add(tempPr);
      }
    });
  }

  Future saveOrCreateRutina(Rutina rutina) async {
    isSaving = true;
    notifyListeners();

    final String user = await storage.read(key: 'uid') ?? '';
    rutina.idUser = user;

    //si tenemos id estamos actualizando, sino estamos creando :D
    if (rutina.id == null) {
      await createRutina(rutina);
      //creamos producto
    } else {
      //actualizamos producto
      await updateRutina(rutina);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> updateRutina(Rutina rutina) async {
//HACEMOS LA PETICION

    final url = Uri.https(_baseUrl, 'rutinas/${rutina.id}.json');
    final resp = await http.put(url, body: rutina.toJson());
    final decodedData = resp.body;
    print(decodedData);

    return rutina.id!;
  }

  Future<String> createRutina(Rutina rutina) async {
//HACEMOS LA PETICION

    final url = Uri.https(_baseUrl, 'rutinas.json');
    final resp = await http.post(url, body: rutina.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData);

    rutina.id = decodedData['name'];

    return rutina.id!;
  }

  Future deleteRutina(Rutina rutina) async {
    final url = Uri.https(_baseUrl, 'rutinas/${rutina.id}.json');
    http.delete(url, body: rutina.toJson());
  }

  Future saveOrCreatePr(Pr pr) async {
    isSaving = true;
    notifyListeners();

    final String user = await storage.read(key: 'uid') ?? '';
    pr.idUser = user;

    List<String> lst = [];

    for (var item in controller.prList) {
      lst.add(item.nameEjercicio);
    }

    if (lst.contains(pr.nameEjercicio)) {
      for (var item in controller.prList) {
        if (pr.nameEjercicio == item.nameEjercicio) {
          item.peso = pr.peso;
          await updatePr(item);
          return;
        }
      }
    } else {
      controller.prList.add(pr);
      await createPr(pr);
    }

    isSaving = false;
    notifyListeners();
  }

  Future<String> createPr(Pr pr) async {
//HACEMOS LA PETICION

    final url = Uri.https(_baseUrl, 'pr.json');
    final resp = await http.post(url, body: pr.toJson());
    final decodedData = json.decode(resp.body);
    print(decodedData);

    pr.id = decodedData['name'];

    return pr.id!;
  }

  Future<String> updatePr(Pr pr) async {
//HACEMOS LA PETICION

    print(pr.id);
    final url = Uri.https(_baseUrl, 'pr/${pr.id}.json');
    final resp = await http.put(url, body: pr.toJson());
    final decodedData = resp.body;
    print(decodedData);

    return pr.id!;
  }
}
