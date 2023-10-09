import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';

class BicycleLoading extends ConsumerWidget {
  const BicycleLoading({Key? key, required this.pHeight, required this.pWidth})
      : super(key: key);

  final double pWidth;
  final double pHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: SizedBox(
        width: pWidth,
        height: pHeight,
        child: Image.asset(
          loadingImagePath,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
