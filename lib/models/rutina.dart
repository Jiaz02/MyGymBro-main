import 'dart:convert';

import 'package:my_gym_bro/models/models.dart';

class Rutina {
  Rutina(this.name, this.note, this.listEjerciciosRutina,this.idUser);

  String name;
  String note;
  List<EjercicioRutina>? listEjerciciosRutina = [];
  String? id;
  String? idUser;

  set setName(String name) => this.name = name;

  get getName => name;

  get getNote => note;

  set setNote(note) => note = note;

  get getListEjerciciosRutina => listEjerciciosRutina;

  set setListEjerciciosRutina(listEjerciciosRutina) =>
      this.listEjerciciosRutina = listEjerciciosRutina;

  factory Rutina.fromJson(String str) => Rutina.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());
  factory Rutina.fromMap(Map<String, dynamic> json) => Rutina(
        json["name"],
        json["note"],
        List<EjercicioRutina>.from(json["listEjerciciosRutina"]
                ?.map((x) => EjercicioRutina.fromMap(x)) ??
            []),
        json["user"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "note": note,
        "listEjerciciosRutina": List<dynamic>.from(
            listEjerciciosRutina?.map((x) => x.toMap()) ?? []),
        "user": idUser,
      };
  @override
  String toString() {
    // TODO: implement toString
    return (this.name + ' ' + this.note + this.listEjerciciosRutina.toString());
  }
}
