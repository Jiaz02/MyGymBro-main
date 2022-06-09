import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/models/models.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../service/service.dart';

class EntrenosScreen extends StatefulWidget {
  const EntrenosScreen({Key? key}) : super(key: key);

  @override
  State<EntrenosScreen> createState() => _EntrenosScreenState();
}

class _EntrenosScreenState extends State<EntrenosScreen> {
  var nombreRutina = 'Rutina';
  var observacionesRutina = 'Ninguna';

  final controller = Get.find<Listas>();

  late Rutina rutina;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDarkBlue,
      body: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (controller.rutinasList.isEmpty) {
          return const Center(
              child: Text('Crea una rutina con el boton de abajo',
                  style: TextStyle(color: Colors.white, fontSize: 20)));
        }
        return ListView.builder(
            itemCount: controller.rutinasList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: EntrenoCard(controller.rutinasList[index]),
                onTap: () async {
                  print(controller.rutinasList[index]);
                  await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetallesRutina(
                            rutina: controller.rutinasList[index]),
                      ));
                  setState(() {});
                },
              );
            });
      }),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: AppTheme.primaryBlue,
          onPressed: () {
            showCustomDialog(context);
          }),
    );
  }

  void showCustomDialog(BuildContext context) {
    final rutinaService = Provider.of<RutinaService>(context, listen: false);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext cxt) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Material(
              color: AppTheme.primaryBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Nombre de la rutina',
                        style: TextStyle(color: Colors.white)),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          nombreRutina = 'Rutina';
                        } else {
                          nombreRutina = value;
                        }
                      },
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Escribe el nombre',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text('Anotaciones',
                          style: TextStyle(color: Colors.white)),
                    ),
                    TextField(
                      style: const TextStyle(color: Colors.white),
                      onChanged: (value) {
                        if (value.isEmpty) {
                          observacionesRutina = 'Ninguna';
                        } else {
                          observacionesRutina = value;
                        }
                      },
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Escribe las anotaciones',
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextButton(
                        onPressed: () {
                          //Provider.of(context, listen: false);
                          rutina =
                              Rutina(nombreRutina, observacionesRutina, [], '');
                          nombreRutina = 'Rutina';
                          observacionesRutina = '';
                          controller.addRutinaList(rutina);
                          if (mounted) {
                            setState(() {});
                          }
                          rutinaService.saveOrCreateRutina(rutina);
                          Navigator.pop(cxt);
                        },
                        child: const Text('Crear Rutina'),
                        style: TextButton.styleFrom(
                            backgroundColor: AppTheme.primaryBlue,
                            primary: Colors.white,
                            fixedSize: Size(MediaQuery.of(cxt).size.width, 16)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
