import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/infrastructure/datasources/firebase/sponsors_firebase_datasource.dart';
import 'package:revistabike_app/infrastructure/repositories/firebase/sponsors_repository_impl.dart';

final sponsorRepositoryProvider = Provider((ref) {
  return SponsorsRepositoryImpl(datasource: SponsorsFirebaseDatasource());
});
