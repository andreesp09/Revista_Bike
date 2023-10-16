import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class SponsorScreen extends ConsumerWidget {
  static const name = 'sponsor-screen';
  const SponsorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final Sponsor selectedSponsor = ref.watch(selectedSponsorAppProvider);
    return Scaffold(
      //!Widget referente al appbar de la vista
      appBar: CustomAppBar(
          pWidth: maxSizePhone.maxWidth * 0.15,
          pHeight: maxSizePhone.maxHeight * 0.08,
          pIconSize: maxSizePhone.maxHeight * 0.04,
          pColor: theme.primary,
          pOnTap: context.pop),
      body: Column(children: [
        //!Widget referente al texto de "Calendario de eventos"
        CustomAutoSizeText(
          pText: selectedSponsor.name,
          pTextStyle: KCustomTextStyle.kSemiBold(context, 55, theme.primary),
          pWidth: maxSizePhone.maxWidth,
          pHeight: maxSizePhone.maxHeight * 0.08,
          pPadding: maxSizePhone.maxWidth * 0.02,
        ),
        Container(
          padding: const EdgeInsets.all(15),
          width: maxSizePhone.maxWidth * 0.9,
          height: maxSizePhone.maxHeight * 0.6,
          decoration: BoxDecoration(
              color: theme.background,
              border: Border.all(width: 2, color: theme.primary),
              borderRadius: BorderRadius.circular(25)),
          child: _InfoList(
            pSelectedSponsor: selectedSponsor,
            pMaxHeight: maxSizePhone.maxHeight,
          ),
        )
      ]),
    );
  }
}

class _InfoList extends ConsumerWidget {
  final Sponsor pSelectedSponsor;
  final double pMaxHeight;
  const _InfoList({required this.pSelectedSponsor, required this.pMaxHeight});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);

    void goToPageWeb() {}

    return Column(children: [
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: "1",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: "2",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: "3",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: "4",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: "5",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      CustomAutoSizeText(
        pPadding: 0,
        pWidth: double.infinity,
        pHeight: maxSizePhone.maxHeight * 0.08,
        pText: "6",
        pTextStyle: KCustomTextStyle.kMedium(context, 22, theme.primary),
        pTextAlign: TextAlign.center,
      ),
      // Row(
      //   children: [
      //     pSelectedEvent.imagePath.isNotEmpty
      //         ? CustomButton(
      //             pOnTap: goToPageWeb,
      //             pText: "Ver afiche",
      //             pWidth: maxSizePhone.maxWidth * 0.35,
      //             pHeight: maxSizePhone.maxHeight * 0.05,
      //             pButtonColor: theme.primary,
      //             pTextStyle:
      //                 KCustomTextStyle.kMedium(context, 22, Colors.white),
      //           )
      //         : Container(),
      //   ],
      // )
    ]);
  }
}
