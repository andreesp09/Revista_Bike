import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/infrastructure/datasources/firebase/modalities_firebase_datasource.dart';
import 'package:revistabike_app/infrastructure/repositories/firebase/modalities_repository_impl.dart';

final modalityRepositoryProvider = Provider((ref) {
  return ModalitiesRepositoryImpl(datasource: ModalitiesFirebaseDatasource());
});
