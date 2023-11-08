import 'package:flutter/material.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.pText,
      required this.pTextStyle,
      required this.pOnTap,
      required this.pWidth,
      required this.pHeight,
      this.pRadius,
      this.pSpacerWidth,
      this.pIconData,
      this.pElevation,
      this.pTextColor,
      this.pButtonColor,
      this.pBorderColor,
      this.pIconColor});

  final String pText;
  final TextStyle pTextStyle;
  final dynamic pOnTap;
  final double pWidth;
  final double pHeight;
  final double? pSpacerWidth;
  final IconData? pIconData;
  final double? pElevation;
  final double? pRadius;
  final Color? pTextColor;
  final Color? pButtonColor;
  final Color? pBorderColor;
  final Color? pIconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: pWidth,
      height: pHeight,
      decoration: BoxDecoration(
        color: pButtonColor ?? theme.background,
        borderRadius: BorderRadius.circular(pRadius ?? 0),
        border: Border.all(width: 2, color: pBorderColor ?? theme.background),
      ),
      child: Material(
          color: pButtonColor ?? theme.background,
          elevation: pElevation ?? 0,
          borderRadius: BorderRadius.circular(pRadius ?? 0),
          child: InkWell(
            onTap: pOnTap,
            borderRadius: BorderRadius.circular(pRadius ?? 0),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    pText,
                    style: pTextStyle,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(width: pSpacerWidth),
                  pIconData != null
                      ? Icon(
                          pIconData,
                          color: pIconColor,
                        )
                      : Container()
                ],
              ),
            ),
          )),
    );
  }
}

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton({
    Key? key,
    required this.pAllowsSplash,
    required this.pOnTap,
    required this.pIconData,
    required this.pIconSize,
    required this.pWidth,
    required this.pHeight,
    this.pRadius,
    this.pMargin,
    this.pElevation,
    this.pText,
    this.pIconColor,
    this.pButtonColor,
    this.pBorderColor,
  }) : super(key: key);

  final bool pAllowsSplash;
  final VoidCallback pOnTap;
  final IconData pIconData;
  final double pIconSize;
  final double pWidth;
  final double pHeight;
  final double? pRadius;
  final double? pMargin;
  final double? pElevation;
  final String? pText;
  final Color? pIconColor;
  final Color? pButtonColor;
  final Color? pBorderColor;
  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Container(
      width: pWidth,
      height: pHeight,
      decoration: BoxDecoration(
          color: pButtonColor ?? theme.background,
          borderRadius: BorderRadius.circular(pRadius ?? 0),
          border:
              Border.all(width: 2, color: pBorderColor ?? theme.background)),
      child: Material(
          color: pButtonColor ?? theme.background,
          elevation: pElevation ?? 0,
          borderRadius: BorderRadius.circular(pRadius ?? 0),
          child: pAllowsSplash
              ? InkWell(
                  onTap: pOnTap,
                  borderRadius: BorderRadius.circular(pRadius ?? 0),
                  splashColor: Colors.transparent,
                  child: Icon(
                    pIconData,
                    color: pIconColor,
                    size: pIconSize,
                  ))
              : GestureDetector(
                  onLongPress: pOnTap,
                  child: Icon(
                    pIconData,
                    color: pIconColor,
                    size: pIconSize,
                  ),
                )),
    );
  }
}
