import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class ModalityMapper {
  static Modality modalityToEntity(ModalityResponse modalityResponse) =>
      Modality(
          idModality: modalityResponse.id,
          name: modalityResponse.name,
          imagePath: modalityResponse.imagePath,
          priority: int.parse(modalityResponse.priority),
          available: modalityResponse.available);
}
