import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_gym_bro/router/app_routes.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

//creamos un containes para introducir las tarjetas de opciones
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
      child: Container(
        width: double.infinity,
        height: size.height / 4,
        child: Swiper(
          itemCount: 3,
          viewportFraction: 0.8,
          scale: 0.9,
          //layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.9,
          itemBuilder: (_, int index) {
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AppRoutes.menuOption[index].screen)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image(
                  image: AppRoutes.menuOption[index].image,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
