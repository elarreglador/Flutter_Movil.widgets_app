import 'package:flutter/material.dart' show IconData, Icons;

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
  });
}


const appMenuItems = <MenuItem> [

  MenuItem(
    title: "Botones", 
    subTitle: "Varios botones en Flutter", 
    link: "/buttons", 
    icon: Icons.smart_button_outlined
  ),

  MenuItem(
    title: "Tarjetas", 
    subTitle: "Contenedor estilizado", 
    link: "/cards", 
    icon: Icons.credit_card
  ),

  MenuItem(
    title: "Progress Indicators", 
    subTitle: "Generales y controlados", 
    link: "/progress", 
    icon: Icons.refresh_rounded
  ),

  MenuItem(
    title: "Snackbar y dialogs", 
    subTitle: "Indicadores en pantalla", 
    link: "/snackbar", 
    icon: Icons.info_outline
  ),

  MenuItem(
    title: "Animated container", 
    subTitle: "Stateful widget animado", 
    link: "/animated", 
    icon: Icons.check_box_outline_blank_outlined
  ),

  MenuItem(
    title: "UI controls + Tiles", 
    subTitle: "Controles de usuario", 
    link: "/ui-controls", 
    icon: Icons.car_rental_outlined
  ),

  MenuItem(
    title: "App tutorial", 
    subTitle: "Descubre como usar esta app", 
    link: "/tutorial", 
    icon: Icons.help_sharp
  ),

];