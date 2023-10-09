import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class ConfigMapper {
  static Config configDBToEntity(ConfigResponse configResponse) => Config(
      idBdEventos: configResponse.idBdEventos,
      idBdModalidades: configResponse.idBdModalidades,
      idBdPatrocinadores: configResponse.idBdPatrocinadores,
      tokenMapBox: configResponse.tokenMapBox);
}
