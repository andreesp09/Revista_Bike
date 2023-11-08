import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

//? Este provider guarda la lista de videos habilitadas
final videosProvider = StateProvider<List<Video>>((ref) => []);

//? Este provider guarda el index del video que se va a reproducir en pantalla completa
final indexLandscapeVideoProvider = StateProvider<int>((ref) => 0);
