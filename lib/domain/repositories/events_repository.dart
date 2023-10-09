import 'package:revistabike_app/domain/entities/00-entities.dart';

abstract class EventsRepository {
  Future<List<Event>> getAllEventsAvailable();
}
