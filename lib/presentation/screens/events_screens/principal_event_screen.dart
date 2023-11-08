import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class PrincipalEventScreen extends ConsumerWidget {
  static const name = 'principal-event-screen';
  const PrincipalEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final MaxSizePhone maxSizePhone = ref.watch(maxConstrainsProvider);
    final int eventViewSelected = ref.watch(eventViewSelectedProvider);
    final List<Event> events = ref.watch(eventsProvider);

    return Scaffold(
        bottomNavigationBar: CustomSponsorSwiper(
          pWidth: maxSizePhone.maxWidth,
          pHeight: maxSizePhone.maxHeight * 0.12,
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniStartDocked,
        floatingActionButton: eventViewSelected == 0
            ? CustomCircleButton(
                pAllowsSplash: true,
                pOnTap: () {
                  ref
                      .read(filterEventsProvider.notifier)
                      .update((state) => events);
                  ref
                      .read(eventViewSelectedProvider.notifier)
                      .update((state) => 1);
                },
                pIconData: Icons.calendar_month,
                pButtonColor: theme.primary,
                pRadius: 100,
                pIconSize: maxSizePhone.maxWidth * 0.1,
                pIconColor: theme.background,
                pWidth: maxSizePhone.maxWidth * 0.17,
                pHeight: maxSizePhone.maxWidth * 0.17)
            : null,
        body: AppViewsRoutes().homeEventsViews()[eventViewSelected]);
  }
}
