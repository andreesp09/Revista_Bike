import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revistabike_app/domain/datasource/videos_datasources.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/mappers/00-mappers.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class VideosFirebaseDatasource extends VideosDataSource {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Future<List<Video>> getAllVideosAvailable() async {
    //! Se realiza el llamado al api de firebase para obtener los resultados
    QuerySnapshot<Map<String, dynamic>> snapshot = await db
        .collection("Videos")
        .where("Habilitado", isEqualTo: true)
        .get();

    //! Se castea el resultado de firebase al modelo
    final videosResponse = snapshot.docs
        .map((e) => VideoResponse.fromDocumentSnapshot(e))
        .toList();

    //! Se castea el resultado de firebase a la entidad de mi programa
    List<Video> video =
        videosResponse.map((e) => VideoMapper.videoToEntity(e)).toList();

    return video;
  }
}
