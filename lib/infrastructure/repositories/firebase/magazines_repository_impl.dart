import 'package:revistabike_app/domain/datasource/magazines_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/domain/repositories/magazines_repository.dart';

class MagazinesRepositoryImpl extends MagazinesRepository {
  final MagazinesDataSource datasource;

  MagazinesRepositoryImpl({required this.datasource});

  @override
  Future<List<Magazine>> getAllMagazinesAvailable() {
    return datasource.getAllMagazinesAvailable();
  }
}
