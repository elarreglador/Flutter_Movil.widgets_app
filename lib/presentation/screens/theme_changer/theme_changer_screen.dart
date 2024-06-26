import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

  static const name = "theme_changer_screen";

  const ThemeChangerScreen({
    super.key
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final darkMode = ref.watch( themeNotifierProvider ).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text ("Theme Changer"),
        actions: [
          IconButton(
            onPressed: (){
              // dejamos de usar una variable para usar un objeto appTheme.
              // dos ejemplos de uso de ref.read con la variable darkMode:
              // ref.read(isDarkModeProvider.notifier).update((state) => !darkMode);
              // ref.read(isDarkModeProvider.notifier).state = !darkMode;
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
            }, 
            icon: Icon(
              darkMode ?
                Icons.dark_mode_outlined:
                Icons.light_mode_outlined
            )
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  // al ser consumer widget se exige parametro ref
  Widget build(BuildContext context, ref) { 

    final List<Color> colors = ref.watch( colorListProvider );

    // Dejamos de usar una variable para usar un objeto que contiene la variable
    //final int selectedColor = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch( themeNotifierProvider );

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index){
        final Color color = colors[index];

        return RadioListTile(
          title: Text("● Muestra de color █ ▓ ▒ ░", style: TextStyle( color: color)),
          subtitle: Text( "Ref: ${color.value} \n selectedColor provider: $appTheme" ),
          activeColor: color,
          value: index, 
          groupValue: appTheme.selectedColor, 
          onChanged: (value) {
            // previamente la gestion del color era por medio de una variable
            //ref.read(selectedColorProvider.notifier).state = index;
            // ahora se gestiona con un objeto appTheme
            ref.read(themeNotifierProvider.notifier).changeColorIndex(value);
          },
        );
      }
    );
  }
}