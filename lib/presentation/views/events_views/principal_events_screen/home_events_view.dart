import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class HomeEventsView extends ConsumerWidget {
  const HomeEventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final List<Event> comingEvents = ref.watch(comingEventsProvider);

    return Column(children: [
      //!Widget referente al appbar de la vista
      CustomAppBar(
          pWidth: maxSizePhone.maxWidth * 0.15,
          pHeight: maxSizePhone.maxHeight * 0.08,
          pIconSize: maxSizePhone.maxHeight * 0.04,
          pColor: theme.primary,
          pOnTap: () {
            final List<Event> importantEvents =
                ref.watch(importantEventsProvider);
            final List<Event> modalitiesProvider =
                ref.watch(importantEventsProvider);

            if (importantEvents.length < 10) {
              ref.read(comingEventsProvider.notifier).update((state) =>
                  importantEvents
                      .where(
                          (event) => event.name == modalitiesProvider[0].name)
                      .toList());
            } else {
              ref.read(comingEventsProvider.notifier).update((state) =>
                  importantEvents
                      .where(
                          (event) => event.name == modalitiesProvider[0].name)
                      .toList()
                      .sublist(0, 10));
            }
            context.pop();
          }),

      //!Widget referente a las opciones de modalidades en el app
      CustomModalitySwiper(
        pWidth: maxSizePhone.maxWidth,
        pHeight: maxSizePhone.maxHeight * 0.35,
        pTextWidth: maxSizePhone.maxWidth,
        pTextHeight: maxSizePhone.maxHeight * 0.08,
        pImageWidth: maxSizePhone.maxWidth * 0.8,
        pImageHeight: maxSizePhone.maxHeight * 0.24,
        pPading: maxSizePhone.maxHeight * 0.01,
        pRadius: 25,
      ),

      //!Widget referente al texto de "Próximos eventos"
      CustomAutoSizeText(
          pText: 'Próximos eventos',
          pTextStyle: KCustomTextStyle.kSemiBold(context, 55, theme.primary),
          pWidth: maxSizePhone.maxWidth,
          pHeight: maxSizePhone.maxHeight * 0.04,
          pPadding: 0,
          pTextAlign: TextAlign.start),

      //!Widget referente al listado de tarjetas con próximos eventos
      comingEvents.isEmpty
          ? FadeIn(
              child: Padding(
                padding: EdgeInsets.all(maxSizePhone.maxHeight * 0.05),
                child: Container(
                    width: maxSizePhone.maxWidth,
                    height: maxSizePhone.maxHeight * 0.28,
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: Image.asset(
                      noComingEventFind,
                      fit: BoxFit.fill,
                    )),
              ),
            )
          : SizedBox(
              width: maxSizePhone.maxWidth,
              height: maxSizePhone.maxHeight * 0.35,
              child: ListView.builder(
                itemCount: comingEvents.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final Event comingEvent = comingEvents[index];

                  return FadeIn(
                    child: ComingEventCard(
                      pWidth: maxSizePhone.maxWidth * 0.5,
                      pHeight: maxSizePhone.maxHeight * 0.37,
                      pPadding: maxSizePhone.maxHeight * 0.02,
                      pElevetion: 8,
                      pEvent: comingEvent,
                      pIndex: index,
                    ),
                  );
                },
              ),
            ),
    ]);
  }
}
