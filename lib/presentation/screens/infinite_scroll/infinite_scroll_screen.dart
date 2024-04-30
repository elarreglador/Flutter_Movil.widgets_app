import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  
  static const name = 'infinite_screen';
  
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  List<int> imagesIds = [1,2,3,4,5];
  // ignore: unnecessary_new
  final ScrollController scrollController = new ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    // Listener del scroll para agregar nuevas fotos
    scrollController.addListener((){
      // si la posicion actual+500px > posicion maxima...
      if ( (scrollController.position.pixels + 500) > scrollController.position.maxScrollExtent ){
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async{
    if ( isLoading ) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    // evita error si el scrollController no existe
    // esto puede pasar si entramos a InfiniteScrollScreen y 
    // salimos muy rapido
    if (!isMounted ) return;

    setState(() {});
  }

  void addFiveImages(){
    final lastId = imagesIds.last;
    imagesIds.addAll( // agrega a imagesIds.
      // crea una lista temporal que contiene los números del 1 al 5.
      // map se aplica a esta lista para generar una nueva lista.
      // la variable e representa cada elemento de la lista original (1, 2, 3, 4, 5).
      // suma el lastId (obtenido anteriormente) con cada elemento e.
      [1,2,3,4,5].map((e) => lastId + e)
    );

    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appBar: AppBar(
      //  title: const Text("Infinite scroll"),
      //),

      //ListVIew de imagenes
      body: MediaQuery.removePadding(
        context: context,
        //MediaQuery.removePadding + removeTop ignora espacio para barra tareas superior
        removeTop: true, 
        child: ListView.builder(
          controller: scrollController,
          itemCount: imagesIds.length,
          itemBuilder: (context, index) {
            return FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
              placeholder: const AssetImage("assets/Images/jar-loading.gif"), 
              image: NetworkImage("https://picsum.photos/id/${imagesIds[index]}/500/300")
            );
          }
        ),
      ),

      //Boton flotante de regreso
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}