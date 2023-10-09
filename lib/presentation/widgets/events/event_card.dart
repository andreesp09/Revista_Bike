import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class ComingEventCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.all(pPadding),
      child: Card(
        elevation: pElevetion,
        child: Column(children: [
          SizedBox(
            width: pWidth,
            height: pHeight * 0.25,
            child: _TittleContainer(
                pIndex: pIndex,
                pEvent: pEvent,
                theme: theme,
                pWidth: pWidth,
                pHeight: pHeight),
          ),
          Expanded(
              child: _BodyContainer(
                  pWidth: pWidth,
                  pHeight: pHeight,
                  pEvent: pEvent,
                  theme: theme))
        ]),
      ),
    );
  }
}

class _BodyContainer extends StatelessWidget {
  const _BodyContainer({
    required this.pWidth,
    required this.pHeight,
    required this.pEvent,
    required this.theme,
  });

  final double pWidth;
  final double pHeight;
  final Event pEvent;
  final ColorScheme theme;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
        width: pWidth * 0.5,
        height: pHeight,
        child: CustomCachedNetworkImage(pImagePath: pEvent.imagePath),
      ),
      Column(
        children: [
          CustomAutoSizeText(
              pPadding: 0,
              pText: ParseDate().parseFechaDia(pEvent.startDate.toString()),
              pTextStyle:
                  KCustomTextStyle.kSemiBold(context, 20, theme.primary),
              pWidth: pWidth * 0.5,
              pHeight: (pHeight * 0.43) / 3),
          CustomAutoSizeText(
              pPadding: 0,
              pText: ParseDate().parseFechaMes(pEvent.startDate.toString()),
              pTextStyle:
                  KCustomTextStyle.kSemiBold(context, 20, theme.primary),
              pWidth: pWidth * 0.5,
              pHeight: (pHeight * 0.45) / 3),
          CustomAutoSizeText(
              pPadding: 0,
              pText: ParseDate().parseFechaAnnio(pEvent.startDate.toString()),
              pTextStyle:
                  KCustomTextStyle.kSemiBold(context, 20, theme.primary),
              pWidth: pWidth * 0.5,
              pHeight: (pHeight * 0.45) / 3),
        ],
      )
    ]);
  }
}

class _TittleContainer extends StatelessWidget {
  const _TittleContainer({
    required this.pIndex,
    required this.pEvent,
    required this.theme,
    required this.pWidth,
    required this.pHeight,
  });

  final int pIndex;
  final Event pEvent;
  final ColorScheme theme;
  final double pWidth;
  final double pHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          RandomFondoImage().returnFondoImage(pIndex),
          fit: BoxFit.fill,
        ),
        CustomAutoSizeText(
            pPadding: 8,
            pText: pEvent.name,
            pTextStyle: KCustomTextStyle.kSemiBold(context, 25, Colors.black),
            pWidth: pWidth,
            pHeight: pHeight * 0.3),
      ],
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
