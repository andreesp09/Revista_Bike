import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class ComingEventCard extends ConsumerWidget {
  const ComingEventCard({
    super.key,
    required this.pWidth,
    required this.pHeight,
    required this.pPadding,
    required this.pElevetion,
    required this.pIndex,
    required this.pEvent,
  });

  final double pWidth;
  final double pHeight;
  final double pPadding;
  final double pElevetion;
  final int pIndex;
  final Event pEvent;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final List<Modality> modalities = ref.watch(modalitiesProvider);
    final List<Event> events = ref.watch(eventsProvider);
    return Padding(
      padding: EdgeInsets.all(pPadding),
      child: Container(
          width: pWidth,
          height: pHeight,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: theme.primary),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              //!Widget referente a la imagen en la tarjeta de próximos eventos
              SizedBox(
                width: pWidth,
                height: pHeight * 0.3,
                child: CustomCachedNetworkImage(
                  pImagePath: modalities
                      .firstWhere(
                          ((modality) => pEvent.modality == modality.name))
                      .imagePath!,
                ),
              ),

              //!Widget referente al titulo  de la tarjeta de próximos eventos
              SizedBox(
                width: pWidth,
                height: pHeight * 0.3,
                child: CustomAutoSizeText(
                    pPadding: 8,
                    pText: pEvent.name,
                    pTextStyle:
                        KCustomTextStyle.kSemiBold(context, 25, theme.primary),
                    pWidth: pWidth,
                    pHeight: pHeight * 0.3),
              ),

              //!Widget referente al botón de la tarjeta de próximos eventos
              CustomButton(
                  pOnTap: () {
                    ref.read(selectedModalityProvider.notifier).update(
                        (state) => modalities.firstWhere(
                            ((modality) => pEvent.modality == modality.name)));

                    ref.read(filterEventsProvider.notifier).update((state) =>
                        events
                            .where((event) =>
                                event.modality ==
                                    modalities
                                        .firstWhere(((modality) =>
                                            pEvent.modality == modality.name))
                                        .name &&
                                event.isImportanEvent == true)
                            .toList());

                    ref
                        .read(selectedEventProvider.notifier)
                        .update((state) => pEvent);
                    ref
                        .read(eventViewSelectedProvider.notifier)
                        .update((state) => 3);
                  },
                  pText: "Ver evento",
                  pWidth: pWidth * 0.8,
                  pHeight: pHeight * 0.15,
                  pButtonColor: theme.primary,
                  pBorderColor: theme.primary,
                  pTextStyle:
                      KCustomTextStyle.kMedium(context, 22, Colors.white))
            ],
          )),
    );
  }
}

class ListAllEventCard extends ConsumerWidget {
  const ListAllEventCard({
    super.key,
    required this.pWidth,
    required this.pHeight,
    required this.pImageWidth,
    required this.pImageHeight,
    required this.pEvent,
    required this.pRadius,
    required this.pIndex,
    required this.pTextWidth,
    required this.pTextHeight,
  });

  final double pWidth;
  final double pHeight;
  final double pTextWidth;
  final double pTextHeight;
  final double pImageWidth;
  final double pImageHeight;
  final double pRadius;
  final int pIndex;
  final Event pEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final List<Modality> modalities = ref.watch(modalitiesProvider);
    //!Widget referente al padding que ayuda a definir el tamaño de la tarjeta con respecto a los bordes
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: pWidth,
        height: pHeight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(pRadius),
            border: Border.all(width: 1, color: theme.primary)),
        child: Row(children: [
          //!Widget referente de definir el tamaño de la tarjeta
          Container(
            padding: const EdgeInsets.all(5),
            width: pImageWidth,
            height: pImageHeight,

            //!Widget referente de mostrar la imagen de la modalidad
            child: CustomCachedNetworkImage(
                pRadius: 100,
                pImagePath: modalities
                    .firstWhere((modality) => modality.name == pEvent.modality)
                    .imagePath!),
          ),

          Expanded(
            child: Stack(
              children: [
                //!Widget referente del semicirculo de fondo
                Positioned(
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(pRadius),
                      ),
                      width: pWidth * 0.25,
                      height: pHeight * 1.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(pRadius),
                        child: Image.asset(
                          RandomFondoImage().returnFondoImage(pIndex),
                          fit: BoxFit.fill,
                          width: pWidth * 0.32,
                          height: pHeight * 2,
                        ),
                      ),
                    )),

                //!Widget referente semicirculo de fondo
                Positioned(
                  right: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      RandomFondoImage().returnFondoImage(pIndex),
                      fit: BoxFit.fill,
                      width: pWidth * 0.36,
                      height: pHeight * 1.2,
                    ),
                  ),
                ),

                //!Widget referente de la informacion del evento
                Row(children: [
                  Column(
                    children: [
                      //!Widget referente de definir el nombre del evento
                      CustomAutoSizeText(
                          pText: pEvent.name,
                          pTextStyle: KCustomTextStyle.kBoldItalic(
                              context, 22, Colors.black),
                          pWidth: pTextWidth,
                          pHeight: pTextHeight,
                          pPadding: 0),

                      //!Widget referente de definir la ubicación del evento
                      CustomAutoSizeText(
                          pText: pEvent.province != '' && pEvent.location != ''
                              ? "${pEvent.province}, ${pEvent.location}"
                              : "${pEvent.province}${pEvent.location}",
                          pTextStyle: KCustomTextStyle.kLight(
                              context, 18, Colors.black),
                          pWidth: pTextWidth,
                          pHeight: pTextHeight,
                          pPadding: 0)
                    ],
                  ),

                  //!Widget referente de definir la fecha del evento
                  CustomAutoSizeText(
                      pText: ParseDate()
                          .parseFechaCompleta(pEvent.startDate.toString()),
                      pTextStyle:
                          KCustomTextStyle.kLight(context, 20, Colors.black),
                      pWidth: pTextWidth * 0.7,
                      pHeight: pTextHeight,
                      pPadding: 0),
                ]),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
