import 'dart:convert';

class Pr {
  Pr({
    required this.nameEjercicio,
    required this.peso,
    this.idUser
  });

  String nameEjercicio;
  double peso;
  String? id;
  String? idUser;

  factory Pr.fromJson(String str) => Pr.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pr.fromMap(Map<String, dynamic> json) {
    return Pr(
      nameEjercicio: json["nameEjercicio"],
      idUser: json["user"],
      peso: json["peso"].toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
        "nameEjercicio": nameEjercicio,
        "peso": peso,
        "user": idUser,
      };
}
