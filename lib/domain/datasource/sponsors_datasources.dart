import 'package:revistabike_app/domain/entities/00-entities.dart';

abstract class SponsorsDataSource {
  Future<List<Sponsor>> getAllSponsorsAvailable();
}
