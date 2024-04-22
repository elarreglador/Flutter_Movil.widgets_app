import 'package:flutter/material.dart';

const cards = <Map<String,dynamic>>[
  { 'elevation': 0.0, 'label':'Elevation 0'},
  { 'elevation': 1.0, 'label':'Elevation 1'},
  { 'elevation': 2.0, 'label':'Elevation 2'},
  { 'elevation': 3.0, 'label':'Elevation 3'},
  { 'elevation': 4.0, 'label':'Elevation 4'},
  { 'elevation': 5.0, 'label':'Elevation 5'},
  { 'elevation': 6.0, 'label':'Elevation 6'},
  { 'elevation': 7.0, 'label':'Elevation 7'},
  { 'elevation': 8.0, 'label':'Elevation 8'},
  { 'elevation': 9.0, 'label':'Elevation 9'},
  { 'elevation': 10.0, 'label':'Elevation 10'},
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
          ...cards.map( //_CardType1
            (card) => _CardType1(
              label: card['label'], 
              elevation: card['elevation'] 
            ),
          ),

          ...cards.map( //_CardType2
            (card) => _CardType2(
              label: card['label'], 
              elevation: card['elevation'] 
            ),
          ),

          ...cards.map( //_CardType3
            (card) => _CardType3(
              label: card['label'], 
              elevation: card['elevation'] 
            ),
          ),

          ...cards.map( //_CardType4
            (card) => _CardType4(
              label: card['label'], 
              elevation: card['elevation'] 
            ),
          ),

          const SizedBox( // Nos alejamos del borde inferior
            height: 70,
          )
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
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
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



class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;


  const _CardType2({
    required this.label, 
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all (Radius.circular(12)),
        side: BorderSide(color: colors.outline)
      ),
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
              child: Text( '$label , RoundedRectangleBorder y colors.outline' ),
            )
          ],
        ),
      )
    );
  }
}


class _CardType3 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType3({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceContainerHighest,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )

          ],
        ),
      ),
    );
  }
}


class _CardType4 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType4({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      clipBehavior: Clip.hardEdge, //bordes redondeados
      elevation: elevation,
      child: Stack(
        children: [

          // imagen
          Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/350',
            height: 200,
            fit: BoxFit.cover,
          ),

          // boton 3 puntos
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20) )
              ),
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),

        ],
      ),
    );
  }
}