import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';


class HomeScreen extends StatelessWidget {

  static const String name = "home_screen";

  const HomeScreen({
    super.key
  });

  @override
  Widget build(BuildContext context) {

    // Estado actual del scaffold que usamos en el SideMenu
    // para cerrar el SideMenu
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
      ),
      body: const _HomeView(),
      // Al sideMenu le ennviamos el scaffoldKey para que 
      // pueda cerrarsetras enviarnos a una pagina del menu.
      drawer: SideMenu( scaffoldKey: scaffoldKey,)
    );
  }
}


class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];

        return _CustomListTile(menuItem: menuItem);
      }
    );
  }
}


class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon( menuItem.icon, color: colors.primary ), // muestra el icono de cada elemento
      trailing: Icon( Icons.arrow_forward_ios_rounded, color: colors.primary ), // flecha en cada elemento (android?)
      title: Text(menuItem.title), // muestra el titulo de cada elemento
      subtitle: Text(menuItem.subTitle), // muestra subtitulo de cada elemento
      onTap: () { 
        // SUPERPONE UNA NUEVA PANTALLA
        context.push( menuItem.link );
        // context.push( CardsScreen.name ); //alternativa a link
      },
    );
  }
}