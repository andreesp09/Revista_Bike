import 'package:revistabike_app/domain/entities/00-entities.dart';

abstract class ModalitiesRepository {
  Future<List<Modality>> getAllModalitiesAvailable();
}
