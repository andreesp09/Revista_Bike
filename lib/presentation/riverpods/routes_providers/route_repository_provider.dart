import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/infrastructure/datasources/firebase/routes_firebase_datasource.dart';
import 'package:revistabike_app/infrastructure/repositories/firebase/routes_repository_impl.dart';

final routesRepositoryProvider = Provider((ref) {
  return RoutesRepositoryImpl(datasource: RoutesFirebaseDatasource());
});
