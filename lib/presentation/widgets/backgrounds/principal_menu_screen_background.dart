import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PrincipalMenuScreenBackground extends ConsumerWidget {
  const PrincipalMenuScreenBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        height: size.height * 0.35,
        decoration: ShapeDecoration(
            color: theme.primary,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(10)))),
      ),
    );
  }
}
