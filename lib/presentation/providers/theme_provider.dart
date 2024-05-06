import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Estado para manejar el modo nocturno
final isDarkModeProvider = StateProvider((ref) => true);

// Listado de colores inmutable obtenido de app_theme.dart
final colorListProvider = Provider((ref) => colorList);