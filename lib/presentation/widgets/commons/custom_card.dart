import 'package:flutter/material.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {super.key,
      required this.pElevetion,
      required this.pTittleWidth,
      required this.pTittleHeight,
      required this.pImageWidth,
      required this.pImageHeight,
      required this.pButtonWidth,
      required this.pButtonHeight,
      required this.pInfoCard,
      required this.pIndex,
      required this.pOnTap,
      required this.pTittleButton,
      required this.pWidth,
      required this.pHeight});

  final double pWidth;
  final double pHeight;
  final String pTittleButton;
  final double pElevetion;
  final double pTittleWidth;
  final double pTittleHeight;
  final double pImageWidth;
  final double pImageHeight;
  final double pButtonWidth;
  final double pButtonHeight;
  final dynamic pInfoCard;
  final dynamic pOnTap;
  final int pIndex;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Container(
          width: pWidth,
          height: pHeight,
          decoration: BoxDecoration(
              border: Border.all(width: 2, color: theme.primary),
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //!Widget referente al titulo  de la tarjeta de próximos eventos
              SizedBox(
                width: pTittleWidth,
                height: pTittleHeight,
                child: CustomAutoSizeText(
                    pPadding: 8,
                    pText: pInfoCard.name,
                    pTextStyle:
                        KCustomTextStyle.kSemiBold(context, 25, theme.primary),
                    pWidth: pWidth,
                    pHeight: pHeight * 0.3),
              ),

              //!Widget referente a la imagen en la tarjeta de próximos eventos
              SizedBox(
                width: pImageWidth,
                height: pImageHeight,
                child: CustomCachedNetworkImage(
                  pImagePath: pInfoCard.imagePath,
                ),
              ),
              //!Widget referente al botón de la tarjeta de próximos eventos
              CustomButton(
                  pOnTap: () async {
                    FocusScope.of(context).unfocus();
                    if (isKeyboardVisible) {
                      await KeyboardVisibilityController()
                          .onChange
                          .firstWhere((bool visible) => !visible);
                    }
                    pOnTap(pInfoCard);
                  },
                  pText: pTittleButton,
                  pWidth: pButtonWidth,
                  pHeight: pButtonHeight,
                  pButtonColor: theme.primary,
                  pBorderColor: theme.primary,
                  pTextStyle:
                      KCustomTextStyle.kMedium(context, 22, Colors.white))
            ],
          ));

      // Card(
      //   elevation: pElevetion,
      //   child: Column(children: [
      //     Stack(
      //       children: [
      //         Image.asset(
      //           RandomFondoImage().returnFondoImage(pIndex),
      //           fit: BoxFit.fill,
      //           width: pTittleWidth,
      //           height: pTittleHeight,
      //         ),
      //         CustomAutoSizeText(
      //             pPadding: 8,
      //             pText: pInfoCard.name,
      //             pTextStyle:
      //                 KCustomTextStyle.kSemiBold(context, 22, Colors.black),
      //             pWidth: pTittleWidth,
      //             pHeight: pTittleHeight),
      //       ],
      //     ),
      //     SizedBox(
      //         width: pImageWidth,
      //         height: pImageHeight,
      //         child: CustomCachedNetworkImage(pImagePath: pInfoCard.imagePath)),
      //     SizedBox(height: pTittleHeight * 0.1),
      //     CustomButton(
      //       pText: pTittleButton,
      //       pTextStyle: KCustomTextStyle.kLight(context, 35, theme.background),
      //       pOnTap: () async {
      //         FocusScope.of(context).unfocus();
      //         if (isKeyboardVisible) {
      //           await KeyboardVisibilityController()
      //               .onChange
      //               .firstWhere((bool visible) => !visible);
      //         }
      //         pOnTap(pInfoCard);
      //       },
      //       pWidth: pButtonWidth,
      //       pHeight: pButtonHeight,
      //       pButtonColor: theme.primary,
      //       pTextColor: theme.background,
      //       pBorderColor: theme.background,
      //       pRadius: 10,
      //     )
      //   ]),
      // );
    });
  }
}
