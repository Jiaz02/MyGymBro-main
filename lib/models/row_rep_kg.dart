import 'dart:convert';

class RowRepKg {
  RowRepKg({this.repes, this.kg});

  int? repes = 0;
  int? kg = 0;

  int? get getRepes => repes;

  int? get getKg => kg;

  factory RowRepKg.fromJson(String str) => RowRepKg.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RowRepKg.fromMap(Map<String, dynamic> json) => RowRepKg(
        repes: json["repes"],
        kg: json["kg"],
      );

  Map<String, dynamic> toMap() => {
        "repes": repes,
        "kg": kg,
      };

  @override
  String toString() {
    // TODO: implement toString
    return '$repes x $kg';
  }
}
