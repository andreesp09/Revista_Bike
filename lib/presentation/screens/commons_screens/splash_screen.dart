import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const name = 'splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends ConsumerState<SplashScreen> {
  void loadData() async {
    List<Future<bool>> futures = [
      //! Se obtiene los datos de configuración de la BD y se guardan en el provider
      loadConfigDBData(),
      //! Se obtiene los datos de las modalidades de la BD y se guardan en el provider
      loadModalitiesData(),
      //! Se obtiene los datos de los eventos de la BD y se guardan en el provider
      loadEventsData(),
      //! Se obtiene los datos de los patrocinadores de la BD y se guardan en el provider
      loadSponsorsAppData()
    ];

    List<bool> results = await Future.wait(futures);

    if (!results.contains(false)) {
      //! Terminado los procesos de carga se espera 4 segundos para continuar
      Future.delayed(const Duration(seconds: 4)).then((value) {
        context.go('/menu-options');
      });
    } else {
      //Todo:manejo de error implementar
    }
  }

  Future<bool> loadConfigDBData() async {
    final configDB = await ref.read(configRepositoryProvider).getBDConfig();
    ref.read(configDbProvider.notifier).update((state) => configDB);
    return true;
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
    final List<Event> modalitiesProvider = ref.watch(importantEventsProvider);

    if (importantEvents.length < 10) {
      ref.read(comingEventsProvider.notifier).update((state) => importantEvents
          .where((event) => event.name == modalitiesProvider[0].name)
          .toList());
    } else {
      ref.read(comingEventsProvider.notifier).update((state) => importantEvents
          .where((event) => event.name == modalitiesProvider[0].name)
          .toList()
          .sublist(0, 10));
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final BoxConstraints maxConstraints = constraints;
        Future(() => ref.read(maxConstrainsProvider.notifier).update((state) =>
            MaxSizePhone(
                maxWidth: maxConstraints.maxWidth,
                maxHeight: maxConstraints.maxHeight)));
        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            height: maxConstraints.maxHeight,
            child: Stack(
              children: [
                //! Refiere al background de la pantalla loading

                const SplashScreenBackground(),
                //! Refiere al widget donde esta el logo de la revista en la pantalla loading
                CustomLogoRevistaBike(
                    pWidth: maxConstraints.maxWidth * 0.7,
                    pHeight: maxConstraints.maxHeight * 0.1,
                    pMarginTop: maxConstraints.maxHeight * 0.1),
                //! Refiere al widget donde esta el gif de la bicicleta en la pantalla loading
                BicycleLoading(
                    pWidth: maxConstraints.maxWidth,
                    pHeight: maxConstraints.maxHeight * 0.35)
              ],
            ),
          ),
        );
      },
    );
  }
}
