import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {

  static const name = 'Counter_Screen';

  const CounterScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    var valor = 10;

    return Scaffold(

      appBar: AppBar(
        title: const Text ("Counter Screen"),
      ),

      body: Center(
        child: Text(
          "Valor: $valor", 
          style: Theme.of(context).textTheme.titleLarge
        )
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          valor++;
          //setState(() {});
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}