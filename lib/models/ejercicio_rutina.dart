import 'dart:convert';

import 'package:my_gym_bro/models/models.dart';

class EjercicioRutina {
  EjercicioRutina({
    required this.name,
    required this.tip,
    required this.muscle,
    required this.url,
    required this.listSeries,
  });

  String name;
  String tip;
  List<String> muscle;
  String url;
  List<RowRepKg> listSeries;

  get getListSeries => this.listSeries;

  set setListSeries(listSeries) => this.listSeries = listSeries;

  get getName => name;

  get getTip => tip;

  get getMuscle => muscle;

  get getUrl => url;

  factory EjercicioRutina.fromJson(String str) =>
      EjercicioRutina.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EjercicioRutina.fromMap(Map<String, dynamic> json) {
    return EjercicioRutina(
      muscle: List<String>.from(json["muscle"].map((x) => x)),
      name: json["name"],
      tip: json["tip"],
      url: json["url"],
      listSeries: List<RowRepKg>.from(
          json["listSeries"].map((x) => RowRepKg.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() => {
        "muscle": List<dynamic>.from(muscle.map((x) => x)),
        "name": name,
        "tip": tip,
        "url": url,
        "listSeries": List<dynamic>.from(listSeries.map((x) => x.toMap())),
      };

  @override
  String toString() {
    return name +
        ' ' +
        tip +
        ' ' +
        muscle.toString() +
        ' ' +
        url +
        ' ' +
        listSeries.toString();
  }
}
