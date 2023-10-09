import 'package:flutter_riverpod/flutter_riverpod.dart';

//? Este provider guarda el dato si el container de busqueda esta abierto
final openSearchProvider = StateProvider<bool>((ref) => false);
