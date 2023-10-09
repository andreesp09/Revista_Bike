import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

//? Este provider guarda la lista de eventos habilitadas
final eventsProvider = StateProvider<List<Event>>((ref) => []);

//? Este provider guarda la lista de los eventos prioritarios
final importantEventsProvider = StateProvider<List<Event>>((ref) => []);

//? Este provider guarda la lista de los eventos prioritarios
final commingEventsProvider = StateProvider<List<Event>>((ref) => []);

//? Este provider guarda la lista de los eventos filtrados por el search en el customAppbar
final filterEventsProvider = StateProvider<List<Event>>((ref) => []);

//? Este provider guarda los datos del evento seleccionado
final selectedEventProvider =
    StateProvider<Event>((ref) => EmptyEntities().newEmptyEvent());

//? Este provider guarda la vista que se vera en la pantalla de "PrincipalEventScreen"
final eventViewSelectedProvider = StateProvider<int>((ref) => 0);
