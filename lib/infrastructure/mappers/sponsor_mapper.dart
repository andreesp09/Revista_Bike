import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class SponsorMapper {
  static Sponsor sponsorToEntity(SponsorResponse sponsorResponse) => Sponsor(
      idSponsor: sponsorResponse.id,
      name: sponsorResponse.nombre,
      imagePath: sponsorResponse.imagePath,
      available: sponsorResponse.available,
      isSponsorApp: sponsorResponse.isSponsorApp,
      imagePathIcon: sponsorResponse.imagePathIcon);
}
