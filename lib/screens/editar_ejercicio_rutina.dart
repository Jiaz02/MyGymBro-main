import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/ejercicio_rutina.dart';
import 'package:my_gym_bro/models/models.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';

import '../service/service.dart';

class EditarEjercicioRutinaScreen extends StatefulWidget {
  EditarEjercicioRutinaScreen(
      {Key? key,
      required this.ejercicio,
      required this.rutinaService,
      required this.rutina})
      : super(key: key);

  Rutina rutina;
  EjercicioRutina ejercicio;
  final RutinaService rutinaService;

  @override
  State<EditarEjercicioRutinaScreen> createState() =>
      _EditarEjercicioRutinaScreen();
}

class _EditarEjercicioRutinaScreen extends State<EditarEjercicioRutinaScreen> {
  late var numseries = widget.ejercicio.listSeries.length;
  late List<RowRepKg> list = [];

  List<DropdownMenuItem<String>> get dropdownMusculosItems {
    List<DropdownMenuItem<String>> menuMusculosItems = const [
      DropdownMenuItem(child: Text("Selecciona un grupo muscular"), value: ""),
      DropdownMenuItem(child: Text("Pectoral"), value: "Pectoral"),
      DropdownMenuItem(child: Text("Abdomen"), value: "Abdomen"),
      DropdownMenuItem(child: Text("Dorsal"), value: "Dorsal"),
      DropdownMenuItem(child: Text("Biceps"), value: "Biceps"),
      DropdownMenuItem(child: Text("Cuadriceps"), value: "Cuadriceps"),
      DropdownMenuItem(child: Text("Gluteos"), value: "Gluteos"),
      DropdownMenuItem(child: Text("Femoral"), value: "Femoral"),
      DropdownMenuItem(child: Text("Isquiosurales"), value: "Isquiosurales"),
      DropdownMenuItem(child: Text("Triceps"), value: "Triceps"),
      DropdownMenuItem(
          child: Text("Deltoides anterior"), value: "Deltoides anterior"),
      DropdownMenuItem(child: Text("Trapecio"), value: "Trapecio"),
      DropdownMenuItem(child: Text("Oblicuos"), value: "Oblicuos"),
      DropdownMenuItem(
          child: Text("Deltoides posterior"), value: "Deltoides posterior"),
      DropdownMenuItem(child: Text("Gemelos"), value: "Gemelos"),
      DropdownMenuItem(child: Text("Soleo"), value: "Soleo"),
    ];
    return menuMusculosItems;
  }

  List<DropdownMenuItem<EjercicioElement>> get dropdownEjerciciosItems {
    //var currentEjercicio = EjercicioElement(name: widget.ejercicio.name, tip: widget.ejercicio.tip, muscle: widget.ejercicio.muscle, url: widget.ejercicio.url);
    // DropdownMenuItem(child: Text(widget.ejercicio.name), value: currentEjercicio),
    List<DropdownMenuItem<EjercicioElement>> menuEjerciciosItems = [
      DropdownMenuItem(
          child: Text(grupoEjercicios.name), value: grupoEjercicios)
    ];
    for (var item in controller.ejerciciosList) {
      if (item.name != grupoEjercicios.name) {
        if (item.muscle.contains(grupoMuscular)) {
          menuEjerciciosItems
              .add(DropdownMenuItem(child: Text(item.name), value: item));
        }
      }
    }
    return menuEjerciciosItems;
  }

  late var grupoMuscular = widget.ejercicio.muscle[0];
  late var grupoEjercicios = EjercicioElement(
      name: widget.ejercicio.name,
      tip: widget.ejercicio.tip,
      muscle: widget.ejercicio.muscle,
      url: widget.ejercicio.url);
  final controller = Get.find<Listas>();
  late EjercicioElement ejer;
  late EjercicioElement ejercicioElegido = grupoEjercicios;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My GymBro'),
        backgroundColor: AppTheme.primaryBlue,
        centerTitle: true,
      ),
      backgroundColor: AppTheme.primaryDarkBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                  style: const TextStyle(color: Colors.white),
                  dropdownColor: AppTheme.primaryBlue,
                  value: grupoMuscular,
                  items: dropdownMusculosItems,
                  onChanged: (String? newValue) {
                    setState(() {
                      grupoMuscular = newValue ?? '';
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DropdownButtonFormField(
                  value: grupoEjercicios,
                  hint: const Text(
                    'Selecciona Ejercicios',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  //value: grupoEjercicios,
                  dropdownColor: AppTheme.primaryBlue,
                  items: dropdownEjerciciosItems,
                  onChanged: (EjercicioElement? newValue) {
                    setState(() {
                      ejercicioElegido = EjercicioElement(
                          name: newValue?.name ?? '',
                          tip: newValue?.tip ?? '',
                          muscle: newValue?.muscle ?? [],
                          url: newValue?.url ?? '');
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                onChanged: (value) {
                  if (value.isEmpty) {
                    numseries = 0;
                    setState(() {});
                  } else {
                    numseries = int.parse(value);

                    if (numseries > widget.ejercicio.listSeries.length) {
                      var num = widget.ejercicio.listSeries.length;

                      if (numseries > 15) {
                        print(numseries);
                        numseries = 15;
                        for (var i = num; i < numseries; i++) {
                          widget.ejercicio.listSeries
                              .add(RowRepKg(repes: 0, kg: 0));
                          setState(() {});
                        }
                      } else {
                        for (var i = num; i < numseries; i++) {
                          widget.ejercicio.listSeries
                              .add(RowRepKg(repes: 0, kg: 0));
                          setState(() {});
                        }
                      }
                    }
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: const UnderlineInputBorder(),
                    hintText: numseries.toString(),
                    // label: Text('Num Series'),
                    labelStyle: const TextStyle(color: Colors.white),
                    hintStyle: const TextStyle(color: Colors.white)),
              ),
            ),
            ListView.builder(
              itemCount: widget.ejercicio.listSeries.length,
              shrinkWrap: true,
              primary: false,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, int index) {
                return EditRowRepeKg(widget.ejercicio.listSeries[index], list);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  if (list.isEmpty) {
                    list = widget.ejercicio.listSeries;
                  }
                  for (var item in controller.ejerciciosList) {
                    if (item.name == ejercicioElegido.name) {
                      ejer = EjercicioElement(
                          name: item.name,
                          tip: item.tip,
                          muscle: item.muscle,
                          url: item.url);
                    }
                  }
                  widget.ejercicio.listSeries = list;
                  widget.ejercicio.name = ejer.name;
                  widget.ejercicio.tip = ejer.tip;
                  widget.ejercicio.muscle = ejer.muscle;
                  widget.ejercicio.url = ejer.url;
                  widget.rutinaService.saveOrCreateRutina(widget.rutina);
                  Navigator.pop(context);
                },
                child: const Text('Guardar ejercicio'),
                // ignore: prefer_const_constructors
                style: TextButton.styleFrom(
                    backgroundColor: AppTheme.primaryBlue,
                    primary: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 16)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextButton(
                onPressed: () {
                  widget.rutina.listEjerciciosRutina?.remove(widget.ejercicio);
                  widget.rutinaService.saveOrCreateRutina(widget.rutina);
                  Navigator.pop(context);
                },
                child: const Text('Eliminar ejercicio'),
                // ignore: prefer_const_constructors
                style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                    primary: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width, 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
