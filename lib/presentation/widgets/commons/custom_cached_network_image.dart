import 'package:flutter/material.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage(
      {super.key,
      required this.pImagePath,
      this.pRadiusTop,
      this.pRadiusBottom});

  final String pImagePath;
  final double? pRadiusTop;
  final double? pRadiusBottom;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(pRadiusBottom ?? 0),
          top: Radius.circular(pRadiusTop ?? 0)),
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
