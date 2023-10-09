import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

//? Este provider guarda la lista con la información de las revistas en BD
final magazineProvider = StateProvider<List<Magazine>>((ref) => []);

//? Este provider guarda la lista de las revistas filtrados por el search en el customAppbar
final filterMagazineProvider = StateProvider<List<Magazine>>((ref) => []);

//? Este provider guarda los datos de la revista seleccionada
final selectedMagazineProvider =
    StateProvider<Magazine>((ref) => EmptyEntities().newEmptyMagazine());
