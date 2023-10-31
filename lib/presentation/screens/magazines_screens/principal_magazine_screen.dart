import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PrincipalMagazineScreen extends ConsumerWidget {
  static const name = 'principal-magazine-screen';
  const PrincipalMagazineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                return Padding(
                    padding: EdgeInsets.all(maxSizePhone.maxHeight * 0.008),
                    child: CustomCard(
                      pElevetion: 10,
                      pWidth: maxSizePhone.maxWidth,
                      pHeight: maxSizePhone.maxWidth * 0.8,
                      pTittleWidth: maxSizePhone.maxWidth,
                      pTittleHeight: maxSizePhone.maxHeight * 0.06,
                      pImageWidth: maxSizePhone.maxWidth * 0.5,
                      pImageHeight: maxSizePhone.maxHeight * 0.22,
                      pButtonWidth: maxSizePhone.maxWidth * 0.35,
                      pButtonHeight: maxSizePhone.maxHeight * 0.06,
                      pInfoCard: magazine,
                      pIndex: index,
                      pOnTap: selectMagazine,
                      pTittleButton: 'Ver evento',
                    ));
              },
            ),
          ),
        ));
  }
}
