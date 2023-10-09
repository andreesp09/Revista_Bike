import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CardSwiperModality extends ConsumerWidget {
  const CardSwiperModality(
      {super.key,
      required this.pModality,
      required this.pWidth,
      required this.pHeight,
      required this.pTextWidth,
      required this.pTextHeight,
      required this.pImageWidth,
      required this.pImageHeight,
      this.pRadius});

  final Modality pModality;
  final double pWidth;
  final double pHeight;
  final double pTextWidth;
  final double pTextHeight;
  final double pImageWidth;
  final double pImageHeight;
  final double? pRadius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final List<Event> events = ref.watch(eventsProvider);

    void openDialog(BuildContext context, String category) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text('Categorías sin eventos'),
          content: Text(
              'Por el momento no se encuentran eventos disponibles para la modalidad de $category'),
          actions: [
            FilledButton(
              onPressed: () => context.pop(),
              child: const Text('Aceptar'),
            )
          ],
        ),
      );
    }

    return SizedBox(
      width: pWidth,
      height: pHeight,
      child: Column(children: [
        GestureDetector(
          onTap: () {
            final bool exitsEventbyCategory = ref.read(eventsProvider).any(
                (event) =>
                    event.modality == pModality.name &&
                    event.isImportanEvent == true);

            if (exitsEventbyCategory) {
              ref
                  .read(selectedModalityProvider.notifier)
                  .update((state) => pModality);
              ref.read(filterEventsProvider.notifier).update((state) => events
                  .where((event) =>
                      event.modality == pModality.name &&
                      event.isImportanEvent == true)
                  .toList());
              ref.read(eventViewSelectedProvider.notifier).update((state) => 2);
            } else {
              openDialog(context, pModality.name);
            }
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(pRadius ?? 0)),
              width: pImageWidth,
              height: pImageHeight,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(pRadius ?? 0),
                  child: CustomCachedNetworkImage(
                      pImagePath: pModality.imagePath!))),
        ),
        CustomAutoSizeText(
            pPadding: 8,
            pText: pModality.name,
            pTextStyle: KCustomTextStyle.kSemiBold(context, 40, theme.primary),
            pWidth: pTextWidth,
            pHeight: pTextHeight)
      ]),
    );
  }
}
