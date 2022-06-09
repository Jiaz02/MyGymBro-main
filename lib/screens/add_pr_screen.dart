import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../service/service.dart';

class AddPrScreen extends StatefulWidget {
  AddPrScreen({Key? key}) : super(key: key);

  @override
  State<AddPrScreen> createState() => _AddPrScreenState();
}

class _AddPrScreenState extends State<AddPrScreen> {
  List<DropdownMenuItem<EjercicioElement>> get dropdownEjerciciosItems {
    //var currentEjercicio = EjercicioElement(name: widget.ejercicio.name, tip: widget.ejercicio.tip, muscle: widget.ejercicio.muscle, url: widget.ejercicio.url);
    // DropdownMenuItem(child: Text(widget.ejercicio.name), value: currentEjercicio),
    List<DropdownMenuItem<EjercicioElement>> menuEjerciciosItems = [];
    for (var item in controller.ejerciciosList) {
      menuEjerciciosItems
          .add(DropdownMenuItem(child: Text(item.name), value: item));
    }
    return menuEjerciciosItems;
  }

  late Pr pr;

  late String ejercicio;
  late double kg;

  final controller = Get.find<Listas>();

  @override
  Widget build(BuildContext context) {
    final rutinaService = Provider.of<RutinaService>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('My GymBro'),
          centerTitle: true,
        ),
        backgroundColor: AppTheme.primaryDarkBlue,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: DropdownButtonFormField(
                    style: TextStyle(color: Colors.white),
                    dropdownColor: AppTheme.primaryBlue,
                    hint: Text(
                      'Selecciona un ejercicio',
                      style: TextStyle(color: Colors.white),
                    ),
                    items: dropdownEjerciciosItems,
                    onChanged: (EjercicioElement? newValue) {
                      setState(() {
                        ejercicio = newValue?.name ?? '';
                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    kg = double.parse(value);
                  },
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: 'Kg',
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  child: Text('Guardar PR'),
                  // ignore: prefer_const_constructors
                  style: TextButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      primary: Colors.white,
                      fixedSize: Size(MediaQuery.of(context).size.width, 16)),
                  onPressed: () {
                    pr = Pr(nameEjercicio: ejercicio, peso: kg);

                    if (!pr.isNull) {
                      rutinaService.saveOrCreatePr(pr);

                      Navigator.pop(context);
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
