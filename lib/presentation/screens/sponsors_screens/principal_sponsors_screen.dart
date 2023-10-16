import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PrincipalSponsorScreen extends ConsumerWidget {
  static const name = 'principal-sponsor-screen';
  const PrincipalSponsorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final List<Sponsor> sponsorApp = ref.watch(sponsorAppProvider);
    int index = -1;

    void selectSponsor(Sponsor pSponsor) {
      ref.read(selectedSponsorAppProvider.notifier).update((state) => pSponsor);
      context.push('/sponsor');
    }

    return Scaffold(
        appBar: CustomAppBar(
            pWidth: maxSizePhone.maxWidth * 0.15,
            pHeight: maxSizePhone.maxHeight * 0.08,
            pIconSize: maxSizePhone.maxHeight * 0.04,
            pColor: theme.primary,
            pOnTap: context.pop),
        body: SizedBox(
          width: maxSizePhone.maxWidth,
          height: maxSizePhone.maxHeight,
          child: SingleChildScrollView(
            child: MasonryView(
              listOfItem: sponsorApp,
              numberOfColumn: 2,
              itemBuilder: (sponsor) {
                index++;
                return Padding(
                  padding: EdgeInsets.all(maxSizePhone.maxHeight * 0.008),
                  child: InfoCard(
                    pHeightCard: maxSizePhone.maxHeight * 0.075,
                    pWidthCard: maxSizePhone.maxWidth,
                    pRadius: maxSizePhone.maxHeight * 0.06,
                    pIndex: index,
                    pInfoCard: sponsor,
                    pHeightButton: maxSizePhone.maxHeight,
                    pWidthButton: maxSizePhone.maxWidth,
                    pButtonText: "Ver patrocinador",
                    pOnTap: selectSponsor,
                    pIsSponsorCard: true,
                  ),
                );
              },
            ),
          ),
        ));
  }
}
