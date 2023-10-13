import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

//? Este provider guarda la lista de sponsor habilitadas
final sponsorProvider = StateProvider<List<Sponsor>>((ref) => []);

//? Este provider guarda la lista de sponsor habilitadas
final sponsorAppProvider = StateProvider<List<Sponsor>>((ref) => []);

//? Este provider guarda el sponsor seleccionado
final selectedSponsorAppProvider =
    StateProvider<Sponsor>((ref) => EmptyEntities().newEmptySponsor());
