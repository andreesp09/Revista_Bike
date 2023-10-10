import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PrincipalEventScreen extends ConsumerStatefulWidget {
  static const name = 'principal-event-screen';
  const PrincipalEventScreen({Key? key}) : super(key: key);

  @override
  PrincipalEventScreenState createState() => PrincipalEventScreenState();
}

class PrincipalEventScreenState extends ConsumerState<PrincipalEventScreen> {
  void loadData() async {
    final dataState =
        await Future(() => ref.watch(dataPrincipalEventScreenProvider));
    if (dataState == DataState.isLoading) {
      List<Future<bool>> futures = [
        //! Se obtiene los datos de las modalidades de la BD y se guardan en el provider
        loadModalitiesData(),
        //! Se obtiene los datos de los eventos de la BD y se guardan en el provider
        loadEventsData(),
        //! Se obtiene los datos de los patrocinadores de la BD y se guardan en el provider
        loadSponsorsAppData()
      ];

      List<bool> results = await Future.wait(futures);

      if (!results.contains(false)) {
        ref
            .read(dataPrincipalEventScreenProvider.notifier)
            .update((state) => DataState.isLoaded);
      } else {
        //Todo:manejo de error implementar
      }
    }
  }

  Future<bool> loadModalitiesData() async {
    final List<Modality> modalities =
        await ref.read(modalityRepositoryProvider).getAllModalitiesAvailable();

    ref.read(modalitiesProvider.notifier).update((state) => modalities);
    return true;
  }

  Future<bool> loadEventsData() async {
    final List<Event> events =
        await ref.read(eventRepositoryProvider).getAllEventsAvailable();

    ref.read(eventsProvider.notifier).update((state) => events);

    ref.read(importantEventsProvider.notifier).update((state) =>
        events.where((event) => event.isImportanEvent == true).toList());

    final List<Event> importantEvents = ref.watch(importantEventsProvider);

    if (importantEvents.length < 10) {
      ref
          .read(commingEventsProvider.notifier)
          .update((state) => importantEvents);
    } else {
      ref
          .read(commingEventsProvider.notifier)
          .update((state) => importantEvents.sublist(0, 10));
    }
    return true;
  }

  Future<bool> loadSponsorsAppData() async {
    final List<Sponsor> sponsorApp =
        await ref.read(sponsorRepositoryProvider).getAllSponsorsAvailable();
    ref.read(sponsorAppProvider.notifier).update((state) =>
        sponsorApp.where((sponsor) => sponsor.isSponsorApp == true).toList());
    return true;
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final int eventViewSelected = ref.watch(eventViewSelectedProvider);
    final List<Event> events = ref.watch(eventsProvider);

    return Scaffold(
        bottomNavigationBar: CustomSponsorSwiper(
          pWidth: maxSizePhone.maxWidth,
          pHeight: maxSizePhone.maxHeight * 0.12,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: eventViewSelected == 0
            ? CustomButton(
                pOnTap: () {
                  ref
                      .read(filterEventsProvider.notifier)
                      .update((state) => events);
                  ref
                      .read(eventViewSelectedProvider.notifier)
                      .update((state) => 1);
                },
                pText: "Ver calendario de eventos",
                pWidth: maxSizePhone.maxWidth * 0.8,
                pHeight: maxSizePhone.maxHeight * 0.05,
                pButtonColor: theme.primary,
                pBorderColor: theme.primary,
                pTextStyle: KCustomTextStyle.kMedium(context, 22, Colors.white))
            : null,
        body: AppViewsRoutes().homeEventsViews()[eventViewSelected]);
  }
}
