import 'package:revistabike_app/domain/datasource/modalities_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/domain/repositories/modalities_repository.dart';

class ModalitiesRepositoryImpl extends ModalitiesRepository {
  final ModalitiesDataSource datasource;

  ModalitiesRepositoryImpl({required this.datasource});

  @override
  Future<List<Modality>> getAllModalitiesAvailable() {
    return datasource.getAllModalitiesAvailable();
  }
}
