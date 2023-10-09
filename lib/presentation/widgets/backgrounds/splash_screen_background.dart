// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';

class SplashScreenBackground extends ConsumerWidget {
  const SplashScreenBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);

    return ClipPath(
      clipper: TopWidgetClipperLoadingScreenBackground(),
      child: Container(
          height: maxSizePhone.maxHeight * 0.65, color: theme.primary),
    );
  }
}

class TopWidgetClipperLoadingScreenBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controllPoint1 = Offset(0, size.height - 100);
    Offset endPoint1 = Offset(100, size.height - 100);
    Offset controllPoint2 = Offset(size.width, size.height - 100);
    Offset endPoint2 = Offset(size.width, size.height - 200);
    Path path = Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          controllPoint1.dx, controllPoint1.dy, endPoint1.dx, endPoint1.dy)
      ..lineTo(size.width - 100, size.height - 100)
      ..quadraticBezierTo(
          controllPoint2.dx, controllPoint2.dy, endPoint2.dx, endPoint2.dy)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
