import 'package:revistabike_app/domain/entities/00-entities.dart';

abstract class VideosRepository {
  Future<List<Video>> getAllVideosAvailable();
}
