import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

//? Este provider guarda la lista de modalidades habilitadas
final modalitiesProvider = StateProvider<List<Modality>>((ref) => []);

//? Este provider guarda la lista de modalidades habilitadas
final selectedModalityProvider =
    StateProvider<Modality>((ref) => EmptyEntities().newEmptyModality());
