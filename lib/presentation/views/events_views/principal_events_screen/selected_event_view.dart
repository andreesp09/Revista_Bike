import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class SelectedEventsView extends ConsumerWidget {
  const SelectedEventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final selectedEvent = ref.watch(selectedEventProvider);

    void returnHomeEventPage() {
      ref.read(eventViewSelectedProvider.notifier).update((state) => 2);
    }

    return Column(children: [
      //!Widget referente al appbar de la vista
      CustomAppBar(
          pWidth: maxSizePhone.maxWidth * 0.15,
          pHeight: maxSizePhone.maxHeight * 0.08,
          pIconSize: maxSizePhone.maxHeight * 0.04,
          pColor: theme.primary,
          pOnTap: returnHomeEventPage),
      SizedBox(height: maxSizePhone.maxHeight * 0.03),

      //!Widget referente al texto de "Calendario de eventos"
      CustomAutoSizeText(
        pText: selectedEvent.name,
        pTextStyle: KCustomTextStyle.kSemiBold(context, 55, theme.primary),
        pWidth: maxSizePhone.maxWidth,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pPadding: maxSizePhone.maxWidth * 0.02,
      ),
      Container(
        padding: const EdgeInsets.all(15),
        width: maxSizePhone.maxWidth * 0.9,
        height: maxSizePhone.maxHeight * 0.6,
        decoration: BoxDecoration(
            color: theme.background,
            border: Border.all(width: 2, color: theme.primary),
            borderRadius: BorderRadius.circular(25)),
        child: _InfoList(
          pSelectedEvent: selectedEvent,
          pMaxHeight: maxSizePhone.maxHeight,
        ),
      )
    ]);
  }
}

class _InfoList extends ConsumerWidget {
  final Event pSelectedEvent;
  final double pMaxHeight;
  const _InfoList({required this.pSelectedEvent, required this.pMaxHeight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);

    void goToImageEvent() {
      context.push('/poster-event');
    }

    void goToMapLocation() {
      context.push('/location-map');
    }

    return Column(children: [
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: "Categoria: ${pSelectedEvent.category}",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: "Modalidad: ${pSelectedEvent.modality}",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: pSelectedEvent.province.isEmpty
            ? "Provincia: Por definir"
            : "Provincia: ${pSelectedEvent.province} ",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: pSelectedEvent.location.isEmpty
            ? "Lugar: Por definir"
            : "Lugar: ${pSelectedEvent.location} ",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText:
            "Inicia: ${ParseDate().parseFechaCompleta(pSelectedEvent.startDate.toString())}",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText:
            "Finaliza: ${ParseDate().parseFechaCompleta(pSelectedEvent.endDate.toString())}",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      Row(
        children: [
          pSelectedEvent.imagePath.isNotEmpty
              ? CustomButton(
                  pOnTap: goToImageEvent,
                  pText: "Ver afiche",
                  pWidth: maxSizePhone.maxWidth * 0.35,
                  pHeight: maxSizePhone.maxHeight * 0.05,
                  pButtonColor: theme.primary,
                  pTextStyle:
                      KCustomTextStyle.kMedium(context, 22, Colors.white),
                )
              : Container(),
          const Spacer(),
          pSelectedEvent.geoLocation.latitude != 0 ||
                  pSelectedEvent.geoLocation.longitude != 0
              ? CustomButton(
                  pOnTap: goToMapLocation,
                  pText: "Ver ubicación",
                  pWidth: maxSizePhone.maxWidth * 0.35,
                  pHeight: maxSizePhone.maxHeight * 0.05,
                  pButtonColor: theme.primary,
                  pTextStyle:
                      KCustomTextStyle.kMedium(context, 22, Colors.white),
                )
              : Container()
        ],
      )
    ]);
  }
}
