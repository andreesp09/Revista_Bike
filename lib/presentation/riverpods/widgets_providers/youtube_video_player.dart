import 'package:flutter_riverpod/flutter_riverpod.dart';

//? Este provider guarda el dato si el container de busqueda esta abierto
final canClose = StateProvider<bool>((ref) => false);

//? Este provider guarda la vista de la pantalla de reproductor
final isPortraitProvider = StateProvider<bool>((ref) => true);
