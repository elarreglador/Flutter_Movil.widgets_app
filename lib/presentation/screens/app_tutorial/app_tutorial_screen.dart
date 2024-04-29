import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Slides
class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo("Elige bien", "Busca tu restaurante favorito y pide tu comida", "assets/Images/1.png"),
  SlideInfo("Danos unos minutos", "Nuestr@s motoristas van de camino con tu pedido.", "assets/Images/2.png"),
  SlideInfo("Ding-Dong!", "tu pedido ya esta en la puerta", "assets/Images/3.png")
];


class AppTutorialScreen extends StatefulWidget {
  
  static const name = 'tutorial_screen';
  
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  final PageController pageviewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageviewController.addListener((){
      final page = pageviewController.page ?? 0;
      if (!endReached && page >= (slides.length -1.5)){
        setState(() {
          endReached = true;
        });
      }
    });
  }


  @override
  void dispose(){
    pageviewController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // como las imagenes tienen fondo blanco, nuestro scaffold tambien
      backgroundColor: Colors.white,
      body: Stack(
        // paginas de una lista que se deslizan
        children: [

          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl
              ) 
            ).toList()
          ),

          Positioned(
            right: 20,
            bottom: 50,
            child: TextButton(
              onPressed: () => context.pop(), 
              child: const Text("Salir >>",))
          ),

          endReached ?
            Positioned(
              right: 100,
              bottom: 50,
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text("Comenzar"),
              )
            ): const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image( image: AssetImage( imageUrl )),
            const SizedBox(height: 20),
            Text(title , style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle)
          ],
        )
      )
    );
  }
}