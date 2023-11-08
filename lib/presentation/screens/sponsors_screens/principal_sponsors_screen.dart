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
                    child: CustomCard(
                      pElevetion: 10,
                      pWidth: maxSizePhone.maxWidth,
                      pHeight: maxSizePhone.maxHeight * 0.30,
                      pTittleWidth: maxSizePhone.maxWidth,
                      pTittleHeight: maxSizePhone.maxWidth * 0.2,
                      pImageWidth: maxSizePhone.maxWidth * 0.5,
                      pImageHeight: maxSizePhone.maxHeight * 0.1,
                      pButtonWidth: maxSizePhone.maxWidth * 0.35,
                      pButtonHeight: maxSizePhone.maxHeight * 0.06,
                      pInfoCard: sponsor,
                      pIndex: index,
                      pOnTap: selectSponsor,
                    ));
              },
            ),
          ),
        ));
  }
}
