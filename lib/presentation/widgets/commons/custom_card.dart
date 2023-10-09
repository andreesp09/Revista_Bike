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
      required this.pTittleButton});

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
      return Card(
        elevation: pElevetion,
        child: Column(children: [
          Stack(
            children: [
              Image.asset(
                RandomFondoImage().returnFondoImage(pIndex),
                fit: BoxFit.fill,
                width: pTittleWidth,
                height: pTittleHeight,
              ),
              CustomAutoSizeText(
                  pPadding: 8,
                  pText: pInfoCard.name,
                  pTextStyle:
                      KCustomTextStyle.kSemiBold(context, 22, Colors.black),
                  pWidth: pTittleWidth,
                  pHeight: pTittleHeight),
            ],
          ),
          SizedBox(
              width: pImageWidth,
              height: pImageHeight,
              child: CustomCachedNetworkImage(pImagePath: pInfoCard.imagePath)),
          SizedBox(height: pTittleHeight * 0.1),
          CustomButton(
            pText: pTittleButton,
            pTextStyle: KCustomTextStyle.kLight(context, 35, theme.background),
            pOnTap: () async {
              FocusScope.of(context).unfocus();
              if (isKeyboardVisible) {
                await KeyboardVisibilityController()
                    .onChange
                    .firstWhere((bool visible) => !visible);
              }
              pOnTap(pInfoCard);
            },
            pWidth: pButtonWidth,
            pHeight: pButtonHeight,
            pButtonColor: theme.primary,
            pTextColor: theme.background,
            pBorderColor: theme.background,
            pRadius: 10,
          )
        ]),
      );
    });
  }
}
