import 'package:revistabike_app/domain/datasource/routes_datasource.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/domain/repositories/routes_repository.dart';

class RoutesRepositoryImpl extends RoutesRepository {
  final RoutesDataSource datasource;

  RoutesRepositoryImpl({required this.datasource});

  @override
  Future<List<RouteApp>> getAllRoutesAvailable() {
    return datasource.getAllRoutesAvailable();
  }
}
