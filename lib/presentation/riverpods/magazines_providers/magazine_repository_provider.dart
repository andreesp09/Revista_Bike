import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/infrastructure/datasources/firebase/magazines_firebase_datasource.dart';
import 'package:revistabike_app/infrastructure/repositories/firebase/magazines_repository_impl.dart';

final magazineRepositoryProvider = Provider((ref) {
  return MagazinesRepositoryImpl(datasource: MagazinesFirebaseDatasource());
});
