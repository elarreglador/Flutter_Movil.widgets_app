import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  
  static const name = 'ui_controls_screen';
  
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls + Tiles"),
      ),

      body: const _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();

  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {

  bool switchIsActive = false;
  Transportation selectedTransportation = Transportation.car;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        // Interruptor
        SwitchListTile(
          title: const Text("SwitchListTile"),
          subtitle: const Text("Interruptor true/false"),
          value: switchIsActive, 
          onChanged: (value) => setState(() { //Permite el movimiento del switch
            switchIsActive = !switchIsActive;
          }),
        ),

        Padding(
          padding: const EdgeInsets.all(20),
          // Text("${selectedTransportation") devolveria selectedTransportation.car por lo que 
          // usaremos split para capturar solo la opcion elegida
          child: Text("Hoy viajaremos en ${selectedTransportation.toString().split('.')[1]}")
        ),

        // Radio buttons comunicados por el enum Transportation
        RadioListTile(
          title: const Text("By car"),
          subtitle: const Text("La segunda forma mas comun de viajar"),
          value: Transportation.car, 
          groupValue: selectedTransportation, 
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.car;
          }),
        ),
        RadioListTile(
          title: const Text("By plane"),
          subtitle: const Text("La forma mas rapida de viajar"),
          value: Transportation.plane, 
          groupValue: selectedTransportation, 
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.plane;
          }),
        ),
        RadioListTile(
          title: const Text("By boat"),
          subtitle: const Text("La forma mas relajante de viajar"),
          value: Transportation.boat, 
          groupValue: selectedTransportation, 
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.boat;
          }),
        ),
        RadioListTile(
          title: const Text("By submarine"),
          subtitle: const Text("Una experiencia diferente"),
          value: Transportation.submarine, 
          groupValue: selectedTransportation, 
          onChanged: (value) => setState(() {
            selectedTransportation = Transportation.submarine;
          }),
        ),


      ],
    );
  }
}