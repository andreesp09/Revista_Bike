import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class VideoMapper {
  static Video videoToEntity(VideoResponse videoResponse) => Video(
      idVideo: videoResponse.idVideo,
      videoPath: videoResponse.videoPath,
      available: videoResponse.available,
      videoName: videoResponse.videoName);
}
