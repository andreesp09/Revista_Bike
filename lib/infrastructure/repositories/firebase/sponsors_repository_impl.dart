import 'package:revistabike_app/domain/datasource/sponsors_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/domain/repositories/sponsors_repository.dart';

class SponsorsRepositoryImpl extends SponsorsRepository {
  final SponsorsDataSource datasource;

  SponsorsRepositoryImpl({required this.datasource});

  @override
  Future<List<Sponsor>> getAllSponsorsAvailable() {
    return datasource.getAllSponsorsAvailable();
  }
}
