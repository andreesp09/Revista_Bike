import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/infrastructure/datasources/firebase/events_firebase_datasource.dart';
import 'package:revistabike_app/infrastructure/repositories/firebase/events_repository_impl.dart';

final eventRepositoryProvider = Provider((ref) {
  return EventsRepositoryImpl(datasource: EventsFirebaseDatasource());
});
