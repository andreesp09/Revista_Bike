import 'package:revistabike_app/domain/datasource/events_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/domain/repositories/events_repository.dart';

class EventsRepositoryImpl extends EventsRepository {
  final EventsDataSource datasource;

  EventsRepositoryImpl({required this.datasource});

  @override
  Future<List<Event>> getAllEventsAvailable() {
    return datasource.getAllEventsAvailable();
  }
}
