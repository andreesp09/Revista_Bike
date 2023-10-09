import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class MenuOptionsScreen extends ConsumerWidget {
  static const name = 'menu-options-screen';
  const MenuOptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    return Scaffold(
      appBar: CustomCloseAppBar(
          pWidth: maxSizePhone.maxWidth * 0.15,
          pHeight: maxSizePhone.maxHeight * 0.1,
          pIconSize: maxSizePhone.maxHeight * 0.04,
          pColor: theme.primary),
      body: Stack(children: [
        //! Refiere al background de la pantalla loading
        const PrincipalMenuScreenBackground(),

        //! Refiere al widget donde esta el logo de la revista
        CustomLogoRevistaBike(
            pWidth: maxSizePhone.maxWidth * 0.7,
            pHeight: maxSizePhone.maxHeight * 0.1,
            pMarginTop: maxSizePhone.maxHeight * 0.05),

        //! Refiere al widget donde esta la opción del menu a ingresar
        Column(children: [
          SizedBox(
              width: maxSizePhone.maxWidth,
              height: maxSizePhone.maxHeight * 0.20),
          const Expanded(
            child: _PrincipalPageOptions(),
          )
        ])
      ]),
    );
  }
}

class _PrincipalPageOptions extends ConsumerWidget {
  const _PrincipalPageOptions();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;
    return Swiper(
      autoplay: false,
      itemCount: AppViewsRoutes().principalMenuOptionView().length,
      control: SwiperControl(size: size.height * 0.08),
      itemBuilder: (context, index) {
        final viewMenuRoute = AppViewsRoutes().principalMenuOptionView()[index];
        return viewMenuRoute;
      },
    );
  }
}
