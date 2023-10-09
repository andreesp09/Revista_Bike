import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revistabike_app/domain/datasource/configurations_datasource.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/mappers/00-mappers.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class ConfigFirebaseDataSource extends ConfigDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<Config> getBDConfig() async {
    //! Se realiza el llamado al api de firebase para obtener los resultados
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("Configuracion").get();

    //! Se castea el resultado de firebase al modelo
    final configResponse = snapshot.docs
        .map((e) => ConfigResponse.fromDocumentSnapshot(e))
        .toList();

    Config config =
        configResponse.map((e) => ConfigMapper.configDBToEntity(e)).first;

    return config;
  }
}
