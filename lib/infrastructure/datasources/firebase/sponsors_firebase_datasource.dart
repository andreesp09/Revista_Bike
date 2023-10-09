import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revistabike_app/domain/datasource/sponsors_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/mappers/00-mappers.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class SponsorsFirebaseDatasource extends SponsorsDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<Sponsor>> getAllSponsorsAvailable() async {
    //! Se realiza el llamado al api de firebase para obtener los resultados
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Patrocinadores")
        .where("Habilitado", isEqualTo: true)
        .get();

    //! Se castea el resultado de firebase al modelo
    final sponsorResponse = snapshot.docs
        .map((e) => SponsorResponse.fromDocumentSnapshot(e))
        .toList();

    //! Se castea el resultado de firebase a la entidad de mi programa
    List<Sponsor> sponsor =
        sponsorResponse.map((e) => SponsorMapper.sponsorToEntity(e)).toList();

    return sponsor;
  }
}
