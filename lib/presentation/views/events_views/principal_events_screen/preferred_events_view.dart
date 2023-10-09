import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PreferredEventsView extends ConsumerWidget {
  const PreferredEventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final Modality modalitySelected = ref.watch(selectedModalityProvider);
    final List<Event> filterEvents = ref.watch(filterEventsProvider);
    int index = -1;

    void returnHomeEventPage() {
      ref.read(filterEventsProvider.notifier).update((state) => []);
      ref.read(openSearchProvider.notifier).update((state) => false);
      ref.read(eventViewSelectedProvider.notifier).update((state) => 0);
    }

    void selectEvent(Event pSelectedEvent) {
      ref.read(selectedEventProvider.notifier).update((state) => pSelectedEvent);
      ref.read(eventViewSelectedProvider.notifier).update((state) => 3);
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
            pText: 'Eventos de ${modalitySelected.name}',
            pTextStyle: KCustomTextStyle.kSemiBold(context, 55, theme.primary),
            pWidth: maxSizePhone.maxWidth,
            pHeight: maxSizePhone.maxHeight * 0.06,
            pPadding: 0),

        //!Widget referente al listado de tarjetas con todos eventos
        Expanded(
          child: SingleChildScrollView(
            child: MasonryView(
              listOfItem: filterEvents,
              numberOfColumn: 2,
              itemBuilder: (event) {
                index++;
                return CustomCard(
                  pElevetion: 10,
                  pTittleWidth: maxSizePhone.maxWidth * 0.5,
                  pTittleHeight: maxSizePhone.maxHeight * 0.1,
                  pImageWidth: maxSizePhone.maxWidth * 0.5,
                  pImageHeight: maxSizePhone.maxHeight * 0.22,
                  pButtonWidth: maxSizePhone.maxWidth * 0.35,
                  pButtonHeight: maxSizePhone.maxHeight * 0.06,
                  pInfoCard: event,
                  pIndex: index,
                  pOnTap: selectEvent,
                  pTittleButton: 'Ver evento',
                );
              },
            ),
          ),
        )
      ]),
    );
  }
}
