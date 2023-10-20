import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class RouteMapper {
  static RouteApp routeToEntity(RouteResponse routeResponse) => RouteApp(
      idRoute: routeResponse.idRoute,
      available: routeResponse.available,
      geoEndLocation: routeResponse.geoEndLocation,
      geoStartLocation: routeResponse.geoStartLocation);
}
