import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';

class EmptyEntities {
  Event newEmptyEvent() {
    return Event(
        idEvent: '',
        category: '',
        province: '',
        location: '',
        geoLocation: const GeoPoint(0, 0),
        modality: '',
        name: '',
        imagePath: '',
        startDate: 0,
        endDate: 0,
        available: true,
        isImportanEvent: false,
        sponsorsEvent: []);
  }

  Config newEmptyConfig() {
    return Config(
        idBdEventos: '',
        idBdModalidades: '',
        idBdPatrocinadores: '',
        tokenMapBox: '');
  }

  Modality newEmptyModality() {
    return Modality(
        idModality: '', name: '', imagePath: '', priority: 0, available: false);
  }

  Magazine newEmptyMagazine() {
    return Magazine(
        edition: 0, name: '', imagePath: '', magazinePath: '', idMagazine: '');
  }

  Sponsor newEmptySponsor() {
    return Sponsor(
        idSponsor: '',
        name: '',
        imagePath: '',
        available: false,
        isSponsorApp: true,
        imagePathIcon: '');
  }

  RouteApp newEmptyRoute() {
    return RouteApp(
        idRoute: '',
        available: false,
        geoEndLocation: const GeoPoint(0, 0),
        geoStartLocation: const GeoPoint(0, 0));
  }

  Video newEmptyVideo() {
    return Video(idVideo: '', videoName: '', videoPath: '', available: false);
  }
}
