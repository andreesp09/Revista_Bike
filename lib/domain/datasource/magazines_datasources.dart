import 'package:revistabike_app/domain/entities/00-entities.dart';

abstract class MagazinesDataSource {
  Future<List<Magazine>> getAllMagazinesAvailable();
}
