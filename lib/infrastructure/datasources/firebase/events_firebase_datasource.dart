import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revistabike_app/domain/datasource/events_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/mappers/00-mappers.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class EventsFirebaseDatasource extends EventsDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<Event>> getAllEventsAvailable() async {
    //! Se realiza el llamado al api de firebase para obtener los resultados
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Eventos")
        .where("Habilitado", isEqualTo: true)
        .get();

    //! Se castea el resultado de firebase al modelo
    final eventsResponse = snapshot.docs
        .map((e) => EventResponse.fromDocumentSnapshot(e))
        .toList();

    //! Se castea el resultado de firebase a la entidad de mi programa
    List<Event> events =
        eventsResponse.map((e) => EventMapper.eventToEntity(e)).toList();

    events.sort((a, b) => a.startDate.compareTo(b.startDate));
    return events;
  }
}
