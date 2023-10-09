import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/infrastructure/models/00-models.dart';

class EventMapper {
  static Event eventToEntity(EventResponse eventResponse) => Event(
      idEvent: eventResponse.idEvent,
      category: eventResponse.category,
      province: eventResponse.province,
      location: eventResponse.location,
      geoLocation: eventResponse.geoLocation,
      modality: eventResponse.modality,
      name: eventResponse.name,
      imagePath: eventResponse.imagePath!,
      startDate: int.parse(eventResponse.startDate),
      endDate: int.parse(eventResponse.endDate),
      available: eventResponse.available,
      isImportanEvent: eventResponse.isImportanEvent,
      sponsorsEvent: eventResponse.sponsorsEvent!
          .map((sponsorEvent) => sponsorEvent.toString())
          .toList());
}
