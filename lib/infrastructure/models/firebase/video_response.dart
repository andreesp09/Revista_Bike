import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class VideoResponse {
  final String idVideo;
  final String videoName;
  final String videoPath;
  final bool available;

  VideoResponse(
      {required this.idVideo,
      required this.videoName,
      required this.videoPath,
      required this.available});

  Map<String, dynamic> toJson() => {
        "Id": idVideo,
        "Habilitado": available,
        "VideoPath": videoPath,
        "NombreVideo": videoName,
      };

  factory VideoResponse.fromJson(Map<String, dynamic> json) => VideoResponse(
        idVideo: json["Id"],
        available: json["Habilitado"],
        videoPath: json["VideoPath"],
        videoName: json["NombreVideo"],
      );

  factory VideoResponse.fromDocumentSnapshot(
          DocumentSnapshot<Map<String, dynamic>> doc) =>
      VideoResponse(
        available: doc.data()!["Habilitado"],
        idVideo: doc.id,
        videoPath: YoutubePlayer.convertUrlToId(doc.data()!["VideoPath"]) ?? '',
        videoName: doc.data()!["NombreVideo"],
      );
}
