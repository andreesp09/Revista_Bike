import 'package:revistabike_app/domain/entities/00-entities.dart';

abstract class MagazinesRepository {
  Future<List<Magazine>> getAllMagazinesAvailable();
}
