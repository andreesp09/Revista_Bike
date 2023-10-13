import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class SponsorCard extends ConsumerWidget {
  const SponsorCard({
    Key? key,
    required this.pHeightCard,
    required this.pWidthCard,
    required this.pRadius,
    required this.pIndex,
    this.pSponsor,
    required this.pOnTap,
  }) : super(key: key);

  final int pIndex;
  final dynamic pSponsor;
  final Function pOnTap;
  final double pHeightCard;
  final double pWidthCard;
  final double pRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () => pOnTap(pSponsor),
      child: Material(
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
        elevation: 8,
        child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: theme.primary),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(20))),
            child: Stack(children: [
              Image.asset(
                RandomFondoImage().returnFondoImage(pIndex),
              ),
              Column(children: [
                CustomAutoSizeText(
                    pText: pSponsor.name,
                    pTextStyle:
                        KCustomTextStyle.kSemiBold(context, 25, Colors.black),
                    pWidth: pWidthCard,
                    pHeight: pHeightCard,
                    pPadding: 5),
                CircleAvatar(
                    backgroundColor: theme.background,
                    radius: pRadius,
                    backgroundImage: NetworkImage(pSponsor.imagePathIcon)),
                SizedBox(
                  height: pHeightCard * 0.1,
                )
              ]),
            ])),
      ),
    );
  }
}
