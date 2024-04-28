// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SnackbarScreen extends StatelessWidget {
  
  static const name = 'snackbar_screen';

  static const agradecimiento = 
      """
¡Gracias por usar mi aplicación!
Tu opinión es invaluable para mí. Como desarrollador, me esfuerzo por crear la mejor experiencia posible para mis usuarios, y tu feedback es fundamental para lograrlo.

Agradezco enormemente que hayas dedicado tu tiempo a usar mi aplicación. Espero que te haya resultado útil.

Si tienes algún comentario o sugerencia, no dudes en compartirlo conmigo. Siempre estoy buscando formas de mejorar y tu aportación es crucial para este proceso.

¡Espero seguir escuchándote!

Atentamente,

David M.

P.D. No dudes en compartir mi aplicación con tus colegas y amigos. ¡Cuantos más usuarios tenga, mejor!
      """;
  
  const SnackbarScreen({super.key});

  void showCustomSnackbar( BuildContext context ){
    ScaffoldMessenger.of(context).clearSnackBars(); // borra snackBars anteriores
    ScaffoldMessenger.of(context).showSnackBar( //en el scaffold mas cercano
      const SnackBar(content: Text("Hola mundo."))
    );
  }

  // Dialogo no prefabricado
  void openDialog( BuildContext context ) {
    showDialog(
      context: context, 
      barrierDismissible: false, // no cierra dialogo pulsando fuera
      builder: (context) => AlertDialog(
        title: const Text("Aceptas las condiciones?"),
        content: Text ("Bla bla bla... condiciones legales... etc... se considerara propiedad de la empresa al hijo primogenito... bla bla bla... se entrega el alma del usuario a cambio de deseo efimero... clausulas legales... etc..."),
        actions: [
          TextButton(onPressed: (){}, child: Text("No acepto.")),
          TextButton(onPressed: (){ context.pop(); }, child: Text("Si, acepto condiciones.")),
          FilledButton(onPressed: (){ context.pop(); }, child: Text("Acepto, no leo condiciones")),
        ],
      )
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbars y dialogos"),
      ),



      // Botones centrales
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //centra verticalmente
          children: [
            FilledButton.tonal(
              onPressed: (){ 
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(agradecimiento)
                  ]
                );
              }, 
              child: Text("Licencias usadas")
            ),
            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
              child: Text("CONDICIONES ABUSIBAS\n(Mostrar dialogo personalizado)")
            )
          ]
        ),
      ),

      // Boton flotante
      floatingActionButton: FloatingActionButton.extended(
        label: const Text( "Mostrar snackbar" ),
        icon: const Icon ( Icons.remove_red_eye_outlined),
        onPressed: (){
          showCustomSnackbar(context);
        } 
      ),
    );
  }
}