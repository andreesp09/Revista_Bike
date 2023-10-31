import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/infrastructure/datasources/firebase/videos_firebase_datasource.dart';
import 'package:revistabike_app/infrastructure/repositories/firebase/videos_repository_impl.dart';

final videoRepositoryProvider = Provider((ref) {
  return VideoRepositoryImpl(datasource: VideosFirebaseDatasource());
});
