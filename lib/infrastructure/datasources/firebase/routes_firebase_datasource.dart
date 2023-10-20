import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revistabike_app/domain/datasource/routes_datasource.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/mappers/00-mappers.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class RoutesFirebaseDatasource extends RoutesDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<RouteApp>> getAllRoutesAvailable() async {
    //! Se realiza el llamado al api de firebase para obtener los resultados
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("Rutas").where("Habilitado", isEqualTo: true).get();

    //! Se castea el resultado de firebase al modelo
    final routesResponse = snapshot.docs
        .map((e) => RouteResponse.fromDocumentSnapshot(e))
        .toList();

    //! Se castea el resultado de firebase a la entidad de mi programa
    List<RouteApp> routes =
        routesResponse.map((e) => RouteMapper.routeToEntity(e)).toList();

    return routes;
  }
}
