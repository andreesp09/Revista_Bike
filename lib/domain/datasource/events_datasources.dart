import 'package:revistabike_app/domain/entities/00-entities.dart';

abstract class EventsDataSource {
  Future<List<Event>> getAllEventsAvailable();
}
