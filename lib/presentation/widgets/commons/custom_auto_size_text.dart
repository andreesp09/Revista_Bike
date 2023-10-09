import 'package:flutter/material.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomAutoSizeText extends StatelessWidget {
  const CustomAutoSizeText(
      {Key? key,
      required this.pText,
      required this.pTextStyle,
      required this.pWidth,
      required this.pHeight,
      this.pTextAlign,
      required this.pPadding})
      : super(key: key);

  final String pText;
  final double pWidth;
  final double pHeight;
  final double pPadding;
  final TextStyle pTextStyle;
  final TextAlign? pTextAlign;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(pPadding),
      width: pWidth,
      height: pHeight,
      child: AutoSizeText(pText,
          style: pTextStyle,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: pTextAlign ?? TextAlign.center),
    );
  }
}
