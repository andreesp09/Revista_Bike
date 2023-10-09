import 'package:flutter/material.dart';
import 'package:revistabike_app/config/00-configs.dart';

class CustomLogoRevistaBike extends StatelessWidget {
  const CustomLogoRevistaBike(
      {Key? key,
      required this.pWidth,
      required this.pHeight,
      required this.pMarginTop})
      : super(key: key);

  final double pWidth;
  final double pHeight;
  final double pMarginTop;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: pWidth,
            height: pHeight,
            margin: EdgeInsets.only(top: pMarginTop),
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: theme.background,
                borderRadius: const BorderRadius.all(Radius.circular(40))),
            child: Image.asset(
              revistaBikeLogo,
              fit: BoxFit.fill,
            )),
      ],
    );
  }
}
