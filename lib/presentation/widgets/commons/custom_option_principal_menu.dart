import 'package:flutter/material.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomOptionPrincipalMenu extends StatelessWidget {
  const CustomOptionPrincipalMenu(
      {Key? key,
      required this.pImageUrl,
      required this.pTitle,
      required this.pSubTitle,
      required this.pOnTap,
      required this.pImageWidth,
      required this.pImageHeight,
      required this.pTextWidth,
      required this.pTextHeight,
      required this.pButtonWidth,
      required this.pButtonHeight})
      : super(key: key);

  final String pImageUrl;
  final String pTitle;
  final String pSubTitle;
  final double pImageWidth;
  final double pImageHeight;
  final double pButtonWidth;
  final double pButtonHeight;
  final double pTextWidth;
  final double pTextHeight;
  final Function pOnTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(children: [
      GestureDetector(
        onTap: () => pOnTap(),
        child: _ImageContainer(
            imageUrl: pImageUrl,
            pImageWidth: pImageWidth,
            pImageHeight: pImageHeight),
      ),
      CustomAutoSizeText(
          pText: pSubTitle,
          pPadding: 8,
          pTextStyle: KCustomTextStyle.kLight(context, 35, Colors.black),
          pWidth: pTextWidth,
          pHeight: pTextHeight),
      CustomButton(
        pOnTap: pOnTap,
        pText: "Ingresar",
        pWidth: pButtonWidth,
        pHeight: pButtonHeight,
        pButtonColor: theme.primary,
        pTextStyle: KCustomTextStyle.kMedium(context, 22, Colors.white),
      )
    ]);
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer({
    required this.imageUrl,
    required this.pImageWidth,
    required this.pImageHeight,
  });

  final String imageUrl;
  final double pImageWidth;
  final double pImageHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
        padding: const EdgeInsets.all(15),
        width: pImageWidth,
        height: pImageHeight,
        decoration: BoxDecoration(
            color: theme.background,
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(150))),
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(150)),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ));
  }
}
