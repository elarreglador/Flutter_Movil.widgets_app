import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  
  static const name = 'animated_screen';
  
  const AnimatedScreen({super.key});

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
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20)
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}