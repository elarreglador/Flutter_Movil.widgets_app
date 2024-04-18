import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {

  static const String name = "buttons_screen";

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons Screen")
      ),
      // los botones no flotantes van aqui
      body: const _ButtonsView(),
      // boton flotante en esquina inf. derecha que vuelve a pantalla atras
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.arrow_back_ios_new_rounded ),
        onPressed: (){
          context.pop(); //funciona gracias a go_router
        } 
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            // Boton 1
            ElevatedButton(onPressed: (){}, child: const Text("Elevated")),
            // Boton 2
            const ElevatedButton(onPressed: null, child: Text("Elevated Disabled")),
            // Boton 3
            ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon( Icons.access_alarm_rounded), 
              label: const Text("ElevatedButton.icon")
            ),
            // Boton 4
            FilledButton(onPressed: (){}, child: const Text("FilledButton")),
            FilledButton.icon(
              icon: const Icon( Icons.accessibility_new_rounded),
              onPressed: (){}, 
              label: const Text("FilledButton.icon")
            ), 
            // Boton 5
            OutlinedButton(
              onPressed: (){}, 
              child: const Text("OutlidedButton"), 
            ),
            // Boton 6
            OutlinedButton.icon(
              icon: const Icon( Icons.add_circle_outline),
              onPressed: (){}, 
              label: const Text("OutlinedButton.icon"), 
            ),
            // Boton 7
            TextButton(
              onPressed: (){}, 
              child: const Text("TextButton")
            ),
            // Boton 8
            TextButton.icon(
              icon: const Icon( Icons.airplane_ticket),
              onPressed: (){}, 
              label: const Text("TextButton.icon")
            ),
            // Boton 9
            // TODO: Custom button
            // Boton 10
            IconButton(
              onPressed: (){}, 
              icon: const Icon( Icons.face)
            ),
            // Boton 11
            IconButton(
              onPressed: (){}, 
              icon: const Icon( Icons.vaping_rooms),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll( colors.primary ),
                iconColor: const MaterialStatePropertyAll( Colors.white)
              ),
            )
          ]),
      ),
    );
  }
}

