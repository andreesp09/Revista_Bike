import 'package:revistabike_app/domain/entities/00-entities.dart';

abstract class VideosDataSource {
  Future<List<Video>> getAllVideosAvailable();
}
