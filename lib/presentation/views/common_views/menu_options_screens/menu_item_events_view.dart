import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class MenuItemEventsView extends ConsumerWidget {
  const MenuItemEventsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    return CustomOptionPrincipalMenu(
      pImageUrl: eventItemMenuImage,
      pTitle: 'Eventos',
      pSubTitle: 'Ingrese para ver información relevantes de eventos',
      pOnTap: () => context.push('/home-event'),
      pImageWidth: maxSizePhone.maxWidth * 0.6,
      pImageHeight: maxSizePhone.maxHeight * 0.5,
      pTextWidth: maxSizePhone.maxWidth * 0.8,
      pTextHeight: maxSizePhone.maxHeight * 0.1,
      pButtonWidth: maxSizePhone.maxWidth * 0.8,
      pButtonHeight: maxSizePhone.maxHeight * 0.065,
    );
  }
}
