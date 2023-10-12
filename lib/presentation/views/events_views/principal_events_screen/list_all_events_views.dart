import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class ListAllEventsView extends ConsumerWidget {
  const ListAllEventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final List<Event> filterEvents = ref.watch(filterEventsProvider);

    void returnHomeEventPage() {
      ref.read(filterEventsProvider.notifier).update((state) => []);
      ref.read(openSearchProvider.notifier).update((state) => false);
      ref.read(eventViewSelectedProvider.notifier).update((state) => 0);
      final List<Event> importantEvents = ref.watch(importantEventsProvider);
      final List<Event> modalitiesProvider = ref.watch(importantEventsProvider);

      if (importantEvents.length < 10) {
        ref.read(comingEventsProvider.notifier).update((state) =>
            importantEvents
                .where((event) => event.name == modalitiesProvider[0].name)
                .toList());
      } else {
        ref.read(comingEventsProvider.notifier).update((state) =>
            importantEvents
                .where((event) => event.name == modalitiesProvider[0].name)
                .toList()
                .sublist(0, 10));
      }
    }

    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Column(children: [
        //!Widget referente al appbar de la vista
        CustomSearchAppBar(
            pWidth: maxSizePhone.maxWidth * 0.15,
            pHeight: maxSizePhone.maxHeight * 0.08,
            pIconSize: maxSizePhone.maxHeight * 0.04,
            pColor: theme.primary,
            pDuration: 500,
            pOnTap: returnHomeEventPage,
            pAppbarFilter: AppbarFilter.event),

        SizedBox(height: maxSizePhone.maxHeight * 0.03),

        //!Widget referente al texto de "Calendario de eventos"
        CustomAutoSizeText(
            pText: 'Calendario de eventos para todas las categorías',
            pTextStyle: KCustomTextStyle.kSemiBold(context, 55, theme.primary),
            pWidth: maxSizePhone.maxWidth,
            pHeight: maxSizePhone.maxHeight * 0.09,
            pPadding: 0),

        //!Widget referente al listado de tarjetas con todos eventos
        Expanded(
          child: ListView.builder(
            itemCount: filterEvents.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              final Event filterEvent = filterEvents[index];
              return ListAllEventCard(
                pWidth: maxSizePhone.maxWidth,
                pHeight: maxSizePhone.maxHeight * 0.15,
                pImageWidth: maxSizePhone.maxWidth * 0.2,
                pImageHeight: maxSizePhone.maxHeight * 0.1,
                pTextWidth: maxSizePhone.maxWidth * 0.4,
                pTextHeight: maxSizePhone.maxHeight * 0.06,
                pEvent: filterEvent,
                pRadius: 25,
                pIndex: index,
              );
            },
          ),
        )
      ]),
    );
  }
}
