import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

/*

Riverpod se basa en el concepto de proveedores. 
Un proveedor es como una caja que almacena un valor que puede 
ser utilizado por cualquier widget en tu aplicación

primero debes definir una función que devuelva el valor. Esta 
función se llama proveedor:

  final isDarkModeProvider = StateProvider((ref) => true);

Para usar un proveedor en un widget, primero debes consumirlo. 
Puedes hacerlo usando el widget Consumer. Busca en
theme_charger_screen.dart el ConsumerWidget donde indicamos que
vamos a usar este valor:

  final bool darkMode = ref.watch( isDarkModeProvider );

Para actualizar el valor de un proveedor, debes usar el método ref.read
de una u otra manera:

  ref.read(isDarkModeProvider.notifier).update((state) => !darkMode);
  ref.read(isDarkModeProvider.notifier).state = !darkMode;

para leer el valor simprelente podemos usar la variable $darkMode

*/

// Estado para manejar el modo nocturno
final isDarkModeProvider = StateProvider((ref) => true);

// Listado de colores inmutable obtenido de app_theme.dart
final colorListProvider = Provider((ref) => colorList);

// Color seleccionado para el tema actual
final selectedColorProvider = StateProvider((ref) => 2);




// Da acceso a toda la app al tema a traves de Riverpod provider
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier() //instancia de AppTheme que creamos abajo
);

class ThemeNotifier extends StateNotifier<AppTheme>{
  // Creamos instancia de la clase AppTheme a compartir
  // STATE o estado = new AppTheme();
  ThemeNotifier(): super( AppTheme() ) ;

  // Funcion para cambiar estado del darkMode
  void toggleDarkMode() {
    // copyWith genera una copia del estado cambiando isDarkMode a !isDarkMode
    state = state.copyWith( isDarkMode: !state.isDarkMode );
  }

  // Funcion para cambiar el color del tema
  void changeColorIndex(){
    //TODO
  }
}