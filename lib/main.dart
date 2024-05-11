import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope( // widget requerido por Riverpod
      child: MainApp()
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {

    // en lugar de usar el darkMode y el color por separado usamos el objeto 
    // appTheme de tipo AppTheme que se comparte con Riverpod provider.
    // * ver 'theme: appTheme.getTheme()' mas abajo *
    //final bool darkMode = ref.watch( isDarkModeProvider );
    //final int selectedColor = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch( themeNotifierProvider );

    return MaterialApp.router(
      title: "Flutter widgets",
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      //theme: AppTheme(selectedColor: selectedColor, isDarkMode: darkMode ).getTheme(),
      theme: appTheme.getTheme(),
    );
  }
}
