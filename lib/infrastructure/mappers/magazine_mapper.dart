import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class MagazineMapper {
  static Magazine magazineToEntity(MagazineResponse magazineResponse) =>
      Magazine(
          idMagazine: magazineResponse.id,
          name: 'Edición ${magazineResponse.edition}',
          edition: int.parse(magazineResponse.edition),
          magazinePath: magazineResponse.pathMagazine,
          imagePath: magazineResponse.pathPortada);
}
