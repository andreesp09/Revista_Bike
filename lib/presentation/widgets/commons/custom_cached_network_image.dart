import 'package:flutter/material.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key, required this.pImagePath, this.pRadius});

  final String pImagePath;
  final double? pRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(pRadius ?? 0),
      child: CachedNetworkImage(
          imageUrl: pImagePath,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              const Skeleton.leaf(
                child: SizedBox(
                  width: 200,
                  height: 200,
                ),
              ),
          errorWidget: (context, url, error) => Image.asset(
                noImagePath,
                fit: BoxFit.fill,
              )),
    );
  }
}
