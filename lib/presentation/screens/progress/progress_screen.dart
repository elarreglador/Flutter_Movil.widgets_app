import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  
  static const name = 'progress_screen';
  
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text ("Progress Indicator"),
      ),
      body: const _ProgressView(),

    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text("Circular progress indicator"),
          SizedBox(height: 30),
          CircularProgressIndicator( strokeWidth: 3, backgroundColor: Colors.black45 ),
          SizedBox(height: 20),

          Text("Circular y linear progress indicator controlado"),
          SizedBox(height: 30),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: 0.0,
      stream: Stream.periodic(const Duration(milliseconds: 100), (value) {
        return (value) / 100; // valores entre 0.00 y 1.00 (100%)
      }).takeWhile((value) => value<100 ), // el stream trabaja mientras que el valor < 100
      builder: (context, snapshot) {

        // progresValue va a ser la data de snapshot de la linea anterior 
        final progressValue = snapshot.data;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator( value: progressValue , strokeWidth: 3, backgroundColor: Colors.black45 ),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator( value: progressValue ) 
              )
            ]
          )
        );
      }
    );
  }
}