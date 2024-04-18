import 'package:go_router/go_router.dart';
// importa un archivo que contiene todas las importaciones de las pantallas
// en lugar de importarlas de una en una
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen()
    ),

    GoRoute(
      path: "/buttons",
      builder: (context, state) => const ButtonsScreen()
    ),

    GoRoute(
      path: "/cards",
      builder: (context, state) => const CardsScreen()
    ),
  ]
);