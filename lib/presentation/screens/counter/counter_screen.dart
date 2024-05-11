import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

// ConsumerWidget es un widget de Riverpod
class CounterScreen extends ConsumerWidget {

  static const name = 'Counter_Screen';

  const CounterScreen({
    super.key
  });

  @override
  // Riverpod requiere el parametro WidgetRef
  Widget build(BuildContext context, WidgetRef ref) {

    // watch queda pendiente del counterProvider
    final int clickCounter = ref.watch( counterProvider );

    // Usamos el objeto appTheme desde el provider para cambiar su variable isDarkMode
    // en lugar de usar la variable darkMode. Ver IconButton.onPressed mas abajo
    //final bool darkMode = ref.watch( isDarkModeProvider );
    final darkMode = ref.watch( themeNotifierProvider ).isDarkMode;


    return Scaffold(

      appBar: AppBar(
        title: const Text ("Counter Screen"),
        actions: [
          IconButton(
            onPressed: (){
              //ref.read(isDarkModeProvider.notifier).update((state) => !darkMode);
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            }, 
            icon: Icon(
              darkMode ?
                Icons.dark_mode_outlined:
                Icons.light_mode_outlined
            )
          )
        ],
      ),

      body: Center(
        child: Text(
          "Valor: $clickCounter", 
          style: Theme.of(context).textTheme.titleLarge
        )
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          // suma 1 y lee el estado de ref
          // ref.read(counterProvider.notifier).update((state) => state +1);
          ref.read( counterProvider.notifier ).state++;
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}