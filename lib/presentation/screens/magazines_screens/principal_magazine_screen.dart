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
              itemBuilder: (sponsor) {
                index++;
                return Padding(
                  padding: EdgeInsets.all(maxSizePhone.maxHeight * 0.008),
                  child: InfoCard(
                    pHeightCard: maxSizePhone.maxHeight * 0.065,
                    pWidthCard: maxSizePhone.maxWidth,
                    pRadius: maxSizePhone.maxHeight * 0.06,
                    pIndex: index,
                    pInfoCard: sponsor,
                    pHeightButton: maxSizePhone.maxHeight,
                    pWidthButton: maxSizePhone.maxWidth,
                    pButtonText: "Ver edición",
                    pOnTap: selectMagazine,
                    pIsSponsorCard: false,
                  ),
                );
              },
            ),
          ),
        ));
  }
}
