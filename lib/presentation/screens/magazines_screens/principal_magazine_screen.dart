import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PrincipalMagazineScreen extends ConsumerStatefulWidget {
  static const name = 'principal-magazine-screen';
  const PrincipalMagazineScreen({super.key});

  @override
  PrincipalMagazineScreenState createState() => PrincipalMagazineScreenState();
}

class PrincipalMagazineScreenState
    extends ConsumerState<PrincipalMagazineScreen> {
  void loadData() async {
    final dataState =
        await Future(() => ref.watch(dataPrincipalMagazineScreenProvider));
    if (dataState == DataState.isLoading) {
      List<Future<bool>> futures = [
        //! Se obtiene los datos de las modalidades de la BD y se guardan en el provider
        loadMagazinesData()
      ];

      List<bool> results = await Future.wait(futures);

      if (!results.contains(false)) {
        ref
            .read(dataPrincipalMagazineScreenProvider.notifier)
            .update((state) => DataState.isLoaded);
      } else {
        //Todo:manejo de error implementar
      }
    }
  }

  Future<bool> loadMagazinesData() async {
    final List<Magazine> magazine =
        await ref.read(magazineRepositoryProvider).getAllMagazinesAvailable();

    ref.read(magazineProvider.notifier).update((state) => magazine);
    ref.read(filterMagazineProvider.notifier).update((state) => magazine);
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
    final List<Magazine> filterMagazine = ref.watch(filterMagazineProvider);
    int index = -1;

    void returnPrincipalMenuOption() {
      ref.read(filterEventsProvider.notifier).update((state) => []);
      ref.read(openSearchProvider.notifier).update((state) => false);
      ref
          .read(filterMagazineProvider.notifier)
          .update((state) => ref.read(magazineProvider));

      context.pop();
    }

    void selectMagazine(Magazine pMagazine) {
      ref.read(selectedMagazineProvider.notifier).update((state) => pMagazine);
      context.push('/magazine');
    }

    return Scaffold(
        appBar: CustomSearchAppBar(
            pWidth: maxSizePhone.maxWidth * 0.15,
            pHeight: maxSizePhone.maxHeight * 0.08,
            pIconSize: maxSizePhone.maxHeight * 0.04,
            pColor: theme.primary,
            pDuration: 500,
            pOnTap: returnPrincipalMenuOption,
            pAppbarFilter: AppbarFilter.magazine),
        body:
            //!Widget referente al listado de tarjetas con todos eventos
            SizedBox(
          width: maxSizePhone.maxWidth,
          height: maxSizePhone.maxHeight,
          child: SingleChildScrollView(
            child: MasonryView(
              listOfItem: filterMagazine,
              numberOfColumn: 2,
              itemBuilder: (magazine) {
                index++;
                return CustomCard(
                  pElevetion: 10,
                  pTittleWidth: maxSizePhone.maxWidth * 0.5,
                  pTittleHeight: maxSizePhone.maxHeight * 0.06,
                  pImageWidth: maxSizePhone.maxWidth * 0.5,
                  pImageHeight: maxSizePhone.maxHeight * 0.22,
                  pButtonWidth: maxSizePhone.maxWidth * 0.35,
                  pButtonHeight: maxSizePhone.maxHeight * 0.06,
                  pInfoCard: magazine,
                  pIndex: index,
                  pOnTap: selectMagazine,
                  pTittleButton: 'Ver revista',
                  pWidth: maxSizePhone.maxWidth,
                  pHeight: maxSizePhone.maxWidth * 0.8,
                );
              },
            ),
          ),
        ));
  }
}
