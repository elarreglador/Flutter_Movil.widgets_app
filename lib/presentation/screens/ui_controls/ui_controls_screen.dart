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

  // valor del switch
  bool switchIsActive = false;
  // valor del select
  Transportation selectedTransportation = Transportation.car;
  // valor del checkBox
  bool chkBox1 = true;
  bool chkBox2 = true;
  bool chkBox3 = false;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [

        // Interruptor
        SwitchListTile(
          title: const Text("SwitchListTile"),
          subtitle: Text("Interruptor [$switchIsActive]"),
          value: switchIsActive, 
          onChanged: (value) => setState(() { //Permite el movimiento del switch
            switchIsActive = !switchIsActive;
          }),
        ),

        // Radio buttons agrupados
        ExpansionTile(
          title: const Text ("Selects en un ExpansionTile"),
          subtitle: Text("Hoy viajaremos en ${selectedTransportation.toString().split('.')[1]}"),
          initiallyExpanded: true,
          children: [
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
        ),

        // CheckBox
        CheckboxListTile(
          title:  const Text("Quiere desayuno"),
          subtitle:  Text("Cafe y tostadas. [$chkBox1]"),
          value: chkBox1, 
          onChanged: (value) => setState(() {
            chkBox1 = !chkBox1;
          })
        ),
        CheckboxListTile(
          title: const Text("Quiere comida"),
          subtitle:  Text("Ensalada y carne o pescado. [$chkBox2]"),
          value: chkBox2, 
          onChanged: (value) => setState(() {
            chkBox2 = !chkBox2;
          })
        ),
        CheckboxListTile(
          title: const Text("Quiere cena"),
          subtitle: Text("Sopa fria (vichyssoise). [$chkBox3]"),
          value: chkBox3, 
          onChanged: (value) => setState(() {
            chkBox3 = !chkBox3;
          })
        ),


      ],
    );
  }
}