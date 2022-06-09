import 'package:flutter/material.dart';
import 'package:my_gym_bro/models/rutina.dart';
import 'package:my_gym_bro/theme/app_theme.dart';

import '../screens/screens.dart';

class EntrenoCard extends StatelessWidget {
  const EntrenoCard(this.rut, {Key? key}) : super(key: key);
  final Rutina rut;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 10),
        width: double.infinity,
        height: 200,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            _backgroundImage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  rut.name,
                  style: TextStyle(color: Colors.white),
                ),
                _editButton(rut),
              ],
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(0, 7), blurRadius: 10)
          ]);
}

// ignore: camel_case_types
class _editButton extends StatefulWidget {
  _editButton(this.rut);
  Rutina rut;
  @override
  State<_editButton> createState() => _editButtonState();
}

class _editButtonState extends State<_editButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: 20.0, right: 20.0, top: 20.0, left: 5.0),
      child: IconButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetallesRutina(rutina: widget.rut),
              ));
          setState(() {});
        },
        icon: const Icon(Icons.edit),
        color: Colors.white,
      ),
    );
  }
}

class _backgroundImage extends StatelessWidget {
  const _backgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 400,
        child: const Image(
          image: AssetImage('assets/cbum.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
