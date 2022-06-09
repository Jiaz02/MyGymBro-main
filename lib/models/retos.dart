// To parse this JSON data, do
//
//     final reto = retoFromJson(jsonString);

import 'dart:convert';

Map<String, Reto> retoFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, Reto>(k, Reto.fromJson(v)));

String retoToJson(Map<String, Reto> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class Reto {
    Reto({
        required this.completado,
        required this.nombre,
    });

    bool completado;
    String nombre;

    factory Reto.fromJson(Map<String, dynamic> json) => Reto(
        completado: json["completado"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "completado": completado,
        "nombre": nombre,
    };
}