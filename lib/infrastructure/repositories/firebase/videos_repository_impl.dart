import 'package:revistabike_app/domain/datasource/videos_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/domain/repositories/videos_repository.dart';

class VideoRepositoryImpl extends VideosRepository {
  final VideosDataSource datasource;

  VideoRepositoryImpl({required this.datasource});
  @override
  Future<List<Video>> getAllVideosAvailable() {
    return datasource.getAllVideosAvailable();
  }
}
