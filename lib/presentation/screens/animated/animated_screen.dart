import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  
  static const name = 'animated_screen';
  
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {

  double width = 250;
  double height = 450;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape(){
    final random = Random();
    // anncho entre 50 y 350
    width = random.nextInt(200)+120;
    // alto entre 50 y 700
    height = random.nextInt(300)+120;
    // color aleatorio
    color = Color.fromRGBO(
      random.nextInt(255), //R
      random.nextInt(255), //G
      random.nextInt(255), //B
      1 //Opacity
    );
    // radio de las esquinas
    borderRadius = random.nextInt(100)+20;

    // actuliza el estado de la figura
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated container"),
      ),

      body: Center(
        // Contenedor que aplica animacion con cambios de tamanyo, color, borde...
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200), // duracion de la nimacion
          curve: Curves.easeOutCubic, // tipo de animacion
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          changeShape();
        },
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}