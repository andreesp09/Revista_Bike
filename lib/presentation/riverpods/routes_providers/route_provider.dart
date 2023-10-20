import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

//? Este provider guarda la lista de rutas habilitadas
final routesProvider = StateProvider<List<RouteApp>>((ref) => []);
