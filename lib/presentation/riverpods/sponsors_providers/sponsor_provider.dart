import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

//? Este provider guarda la lista de modalidades habilitadas
final sponsorProvider = StateProvider<List<Sponsor>>((ref) => []);

//? Este provider guarda la lista de modalidades habilitadas
final sponsorAppProvider = StateProvider<List<Sponsor>>((ref) => []);
