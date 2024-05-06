import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';

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

    return Scaffold(

      appBar: AppBar(
        title: const Text ("Counter Screen"),
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