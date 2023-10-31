import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class VideoMapper {
  static Video videoToEntity(VideoResponse sponsorResponse) => Video(
      idVideo: sponsorResponse.idVideo,
      videoPath: sponsorResponse.videoPath,
      available: sponsorResponse.available);
}
