import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomSponsorSwiper extends ConsumerWidget {
  const CustomSponsorSwiper(
      {Key? key, required this.pWidth, required this.pHeight})
      : super(key: key);

  final double pWidth;
  final double pHeight;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Sponsor> sponsorApp = ref.watch(sponsorAppProvider);
    return SizedBox(
      width: pWidth,
      height: pHeight,
      child: Swiper(
        autoplay: true,
        itemCount: sponsorApp.length,
        itemBuilder: (context, index) {
          final Sponsor sponsor = sponsorApp[index];
          return CustomCachedNetworkImage(
            pImagePath: sponsor.imagePath!,
          );
        },
      ),
    );
  }
}

class CustomEventSponsorSwiper extends ConsumerWidget {
  const CustomEventSponsorSwiper(
      {Key? key,
      required this.pWidth,
      required this.pHeight,
      required this.pSponsor})
      : super(key: key);

  final double pWidth;
  final double pHeight;
  final List<String> pSponsor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: pWidth,
      height: pHeight,
      child: Swiper(
        autoplay: true,
        itemCount: pSponsor.length,
        itemBuilder: (context, index) {
          final String sponsorImage = pSponsor[index];
          return CustomCachedNetworkImage(
            pImagePath: sponsorImage,
          );
        },
      ),
    );
  }
}

class CustomModalitySwiper extends ConsumerWidget {
  const CustomModalitySwiper(
      {Key? key,
      required this.pWidth,
      required this.pHeight,
      required this.pTextWidth,
      required this.pTextHeight,
      required this.pImageWidth,
      required this.pImageHeight,
      this.pPading,
      this.pRadius})
      : super(key: key);

  final double pWidth;
  final double pHeight;
  final double pTextWidth;
  final double pTextHeight;
  final double pImageWidth;
  final double pImageHeight;
  final double? pPading;
  final double? pRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SwiperController swiperController = SwiperController();
    final List<Modality> modalities = ref.watch(modalitiesProvider);

    return modalities.isEmpty
        ? Container()
        : Container(
            padding: EdgeInsets.all(pPading ?? 0),
            width: pWidth,
            height: pHeight,
            child: Swiper(
              controller: swiperController,
              viewportFraction: 0.8,
              scale: 0.8,
              itemCount: modalities.length,
              onIndexChanged: (value) => {
                ref.read(comingEventsProvider.notifier).update((state) => ref
                    .watch(importantEventsProvider)
                    .where((event) => event.modality == modalities[value].name)
                    .toList())
              },
              itemBuilder: (context, index) {
                final Modality modality = modalities[index];
                return FadeIn(
                  child: CardSwiperModality(
                    pModality: modality,
                    pWidth: pWidth,
                    pHeight: pHeight,
                    pTextWidth: pTextWidth,
                    pTextHeight: pTextHeight,
                    pImageWidth: pImageWidth,
                    pImageHeight: pImageHeight,
                    pRadius: pRadius ?? 0,
                  ),
                );
              },
            ),
          );
  }
}
