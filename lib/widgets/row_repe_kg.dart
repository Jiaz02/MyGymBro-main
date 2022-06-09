import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/ejercicio_rutina.dart';
import 'package:my_gym_bro/models/row_rep_kg.dart';
import 'package:my_gym_bro/models/rutina.dart';
import 'package:my_gym_bro/router/app_routes.dart';

class RowRepeKg extends StatelessWidget {
  RowRepeKg(
    this.list, {
    Key? key,
  }) : super(key: key);
  List<RowRepKg> list;
  @override
  Widget build(BuildContext context) {
    var reps = 0;
    var kg = 0;
//creamos un row que muestra y guarda los datos
    return Row(
      children: [
        //con un expanded hacemos que quepan todos en el row sin petar
        const Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child:
                    Text('Num Repes', style: TextStyle(color: Colors.white)))),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: TextField(
            //textInputAction: _showTextFields(),
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              reps = int.parse(value);
            },
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Num',
                hintStyle: TextStyle(color: Colors.white)),
          ),
        )),
        const Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child: Text('Volumen de Carga',
                    style: TextStyle(color: Colors.white)))),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
          child: TextField(
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value.characters.length != 1) {
                kg = int.parse(value);

                RowRepKg serie = RowRepKg(repes: reps, kg: kg);
                print(list);
                list.removeLast();
                list.add(serie);
              } else {
                kg = int.parse(value);

                RowRepKg serie = RowRepKg(repes: reps, kg: kg);
                list.add(serie);
              }
            },
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                hintText: 'Kg',
                hintStyle: TextStyle(color: Colors.white)),
          ),
        )),
        const Expanded(
            child: Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                child: Text('Kg', style: TextStyle(color: Colors.white)))),
      ],
    );
  }
}
