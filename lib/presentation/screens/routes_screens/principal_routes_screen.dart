import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PrincipalRouteScreen extends ConsumerWidget {
  static const name = 'principal-route-screen';
  const PrincipalRouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    return Scaffold(
        appBar: CustomAppBar(
            pWidth: maxSizePhone.maxWidth * 0.15,
            pHeight: maxSizePhone.maxHeight * 0.08,
            pIconSize: maxSizePhone.maxHeight * 0.04,
            pColor: theme.primary,
            pOnTap: context.pop),
        body:
            //!Widget referente al listado de tarjetas con todos eventos
            Container(
          width: maxSizePhone.maxWidth,
          
          height: maxSizePhone.maxHeight,
          color: Colors.amber,
        ));
  }
}
