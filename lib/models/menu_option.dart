//mostramos solo el icon data usando el show
import 'package:flutter/material.dart' show IconData, Widget, AssetImage;

class MenuOption {
  final String route;
  final IconData icon;
  final AssetImage image;
  final String name;
  final Widget screen;

  MenuOption(
      {required this.route,
      required this.image,
      required this.icon,
      required this.name,
      required this.screen});
}
