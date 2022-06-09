import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:my_gym_bro/router/app_routes.dart';
import 'package:my_gym_bro/screens/screens.dart';
import 'package:my_gym_bro/theme/app_theme.dart';
import 'package:my_gym_bro/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../service/service.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);

  final storage = FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authService = Provider.of<AuthService>(context, listen: false);

    final controller = Get.find<Listas>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 26, left: 9, bottom: 26),
            child: GestureDetector(
                child: Container(
                    width: size.width / 1.5,
                    height: size.height / 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: const Image(
                        image: AssetImage('assets/pesos.png'),
                        fit: BoxFit.cover,
                      ),
                    )),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RevisarPr()))),
          ),
          TextButton(
            onPressed: () {
              authService.logout();
              controller.clear();
              Navigator.pushReplacement(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) => LoginScreen()));
            },
            child: Text('Cerrar Sesion'),
            style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                primary: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width, 16)),
          ),
        ],
      ),
    );
  }
}
