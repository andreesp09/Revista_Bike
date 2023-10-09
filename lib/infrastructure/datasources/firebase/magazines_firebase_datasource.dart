import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revistabike_app/domain/datasource/magazines_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/mappers/00-mappers.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class MagazinesFirebaseDatasource extends MagazinesDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<Magazine>> getAllMagazinesAvailable() async {
    //! Se realiza el llamado al api de firebase para obtener los resultados
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("Revistas").get();

    //! Se castea el resultado de firebase al modelo
    final magazineResponse = snapshot.docs
        .map((e) => MagazineResponse.fromDocumentSnapshot(e))
        .toList();

    //! Se castea el resultado de firebase a la entidad de mi programa
    List<Magazine> magazines = magazineResponse
        .map((e) => MagazineMapper.magazineToEntity(e))
        .toList();

    magazines.sort((a, b) => a.edition.compareTo(b.edition));
    return magazines;
  }
}
