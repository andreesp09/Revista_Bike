import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/infrastructure/datasources/firebase/configurations_firebase_datasource.dart';
import 'package:revistabike_app/infrastructure/repositories/firebase/configurations_repository_impl.dart';

final configRepositoryProvider = Provider((ref) {
  return ConfigRepositoryImpl(datasource: ConfigFirebaseDataSource());
});
