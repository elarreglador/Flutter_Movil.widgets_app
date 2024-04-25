import 'package:go_router/go_router.dart';
// importa un archivo que contiene todas las importaciones de las pantallas
// en lugar de importarlas de una en una
import 'package:widgets_app/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen()
    ),

    GoRoute(
      path: "/buttons",
      name: ButtonsScreen.name,
      builder: (context, state) => const ButtonsScreen()
    ),

    GoRoute(
      path: "/cards",
      name: CardsScreen.name,
      builder: (context, state) => const CardsScreen()
    ),

    GoRoute(
      path: "/progress",
      name: ProgressScreen.name,
      builder: (context, state) => const ProgressScreen()
    ),

    GoRoute(
      path: "/snackbar",
      name: SnackbarScreen.name,
      builder: (context, state) => const SnackbarScreen()
    ),

  ]
);