import 'package:revistabike_app/domain/datasource/configurations_datasource.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/domain/repositories/configurations_repository.dart';

class ConfigRepositoryImpl extends ConfigRepository {
  final ConfigDataSource datasource;

  ConfigRepositoryImpl({required this.datasource});

  @override
  Future<Config> getBDConfig() {
    return datasource.getBDConfig();
  }
}
