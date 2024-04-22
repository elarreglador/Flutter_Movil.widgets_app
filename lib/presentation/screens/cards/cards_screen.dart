import 'package:flutter/material.dart';

const cards = <Map<String,dynamic>>[
  { 'elevation': 0.0, 'label':'Elevation 0'},
  { 'elevation': 2.0, 'label':'Elevation 2'},
  { 'elevation': 4.0, 'label':'Elevation 4'},
  { 'elevation': 6.0, 'label':'Elevation 6'},
  { 'elevation': 8.0, 'label':'Elevation 8'},
  { 'elevation': 10.0, 'label':'Elevation 10'},
  { 'elevation': 12.0, 'label':'Elevation 12'},
  { 'elevation': 14.0, 'label':'Elevation 14'},
  { 'elevation': 16.0, 'label':'Elevation 16'},
  { 'elevation': 18.0, 'label':'Elevation 18'},
  { 'elevation': 20.0, 'label':'Elevation 20'},
];

class CardsScreen extends StatelessWidget {

  static const String name = "cards_screen";

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards Screen")
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //muestra todo el mapa de tarjetas como si fuera un bucle
          ...cards.map( 
            (card) => _CardType1(
              label: card['label'], 
              elevation: card['elevation'] 
            ),
          ),

          // probando el SingleChildScrollView superior
          //...cards.map( 
          //  (card) => _CardType1(
          //    label: card['label'], 
          //    elevation: card['elevation'] 
          //  ),
          //)
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;


  const _CardType1({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    // padding entre tarjetas
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Card(
        elevation: elevation,
        child: Padding(
          //paddin dentro de la tarjeta 
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 10), 
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined), 
                  onPressed: () {},
                )
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text( label ),
              )
            ],
          ),
          ),
      ),
    );
  }
}