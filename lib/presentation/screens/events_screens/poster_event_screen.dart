import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PosterEventScreen extends ConsumerWidget {
  static const name = 'poster-event-screen';
  const PosterEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final Event selectedEvent = ref.watch(selectedEventProvider);
    return Scaffold(
      //! Refiere al widget donde esta el appbar y sus opciones
      appBar: CustomAppBar(
          pWidth: maxSizePhone.maxWidth * 0.15,
          pHeight: maxSizePhone.maxHeight * 0.1,
          pIconSize: maxSizePhone.maxHeight * 0.04,
          pColor: theme.primary,
          pOnTap: context.pop),

      //! Refiere al widget a las imágenes de patrocinadores, si el evento no tiene patrocinadores
      //! registrados se verán los patrocinadores del app
      bottomNavigationBar: selectedEvent.sponsorsEvent.isEmpty
          ? CustomSponsorSwiper(
              pWidth: maxSizePhone.maxWidth,
              pHeight: maxSizePhone.maxHeight * 0.12,
            )
          : CustomEventSponsorSwiper(
              pWidth: maxSizePhone.maxWidth,
              pHeight: maxSizePhone.maxHeight * 0.12,
              pSponsor: selectedEvent.sponsorsEvent,
            ),

      //! Refiere al widget donde se muestra el afiche del evento
      body: SizedBox(
          width: maxSizePhone.maxWidth,
          height: maxSizePhone.maxHeight,
          child: CustomCachedNetworkImage(pImagePath: selectedEvent.imagePath)),
    );
  }
}
