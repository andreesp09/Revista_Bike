import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:revistabike_app/config/00-configs.dart';
import 'package:revistabike_app/domain/entities/00-entities.dart';
import 'package:revistabike_app/presentation/riverpods/00-riverpod.dart';
import 'package:revistabike_app/presentation/widgets/00-widgets.dart';

class CustomCloseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomCloseAppBar(
      {Key? key,
      required this.pWidth,
      required this.pHeight,
      this.pColor,
      required this.pIconSize})
      : super(key: key);

  final double pWidth;
  final double pHeight;
  final double pIconSize;
  final Color? pColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Container(
      color: pColor ?? theme.background,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: const EdgeInsets.all(10),
            child: CustomCircleButton(
              pAllowsSplash: false,
              pOnTap: () {},
              pIconData: Icons.pedal_bike_rounded,
              pIconColor: theme.background,
              pIconSize: pIconSize,
              pButtonColor: theme.primary,
              pBorderColor: theme.primary,
              pWidth: pWidth,
              pHeight: pHeight,
              pRadius: 100,
            )),
        Padding(
            padding: const EdgeInsets.all(10),
            child: CustomCircleButton(
              pAllowsSplash: true,
              pOnTap: () => SystemNavigator.pop(),
              pIconData: Icons.logout,
              pIconColor: theme.primary,
              pIconSize: pIconSize,
              pButtonColor: theme.background,
              pBorderColor: theme.primary,
              pWidth: pWidth,
              pHeight: pHeight,
              pRadius: 100,
            ))
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(pHeight);
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.pWidth,
      required this.pHeight,
      this.pColor,
      required this.pIconSize,
      required this.pOnTap})
      : super(key: key);

  final VoidCallback pOnTap;
  final double pWidth;
  final double pHeight;
  final double pIconSize;
  final Color? pColor;

  @override
  Widget build(BuildContext context) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    return Container(
      color: pColor ?? theme.background,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
            padding: const EdgeInsets.all(10),
            child: CustomCircleButton(
              pAllowsSplash: true,
              pOnTap: pOnTap,
              pIconData: Icons.arrow_back_rounded,
              pIconColor: theme.background,
              pIconSize: pIconSize,
              pButtonColor: theme.primary,
              pBorderColor: theme.primary,
              pWidth: pWidth,
              pHeight: pHeight,
              pRadius: 100,
            )),
      ]),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(pHeight);
}

class CustomSearchAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomSearchAppBar(
      {Key? key,
      required this.pWidth,
      required this.pHeight,
      this.pColor,
      required this.pDuration,
      required this.pIconSize,
      required this.pOnTap,
      required this.pAppbarFilter})
      : super(key: key);

  final VoidCallback pOnTap;
  final double pWidth;
  final double pHeight;
  final double pIconSize;
  final int pDuration;
  final Color? pColor;
  final AppbarFilter pAppbarFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ColorScheme theme = Theme.of(context).colorScheme;
    final bool openSearch = ref.watch(openSearchProvider);
    List<Event> filterEvents = ref.watch(eventsProvider);
    List<Magazine> filterMagazine = ref.watch(magazineProvider);

    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Container(
        color: pColor ?? theme.background,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: CustomCircleButton(
                pAllowsSplash: true,
                pOnTap: () async {
                  FocusScope.of(context).unfocus();
                  if (isKeyboardVisible) {
                    await KeyboardVisibilityController()
                        .onChange
                        .firstWhere((bool visible) => !visible);
                  }
                  _controller = TextEditingController();
                  pOnTap();
                },
                pIconData: Icons.arrow_back_rounded,
                pIconColor: theme.background,
                pIconSize: pIconSize,
                pButtonColor: theme.primary,
                pBorderColor: theme.primary,
                pWidth: pWidth,
                pHeight: pHeight,
                pRadius: 100,
              )),
          Row(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: pDuration),
                  width: openSearch ? pWidth * 4 : 0,
                  height: pHeight,
                  child: TextField(
                    controller: _controller,
                    style: KCustomTextStyle.kMedium(
                        context, pWidth * 0.30, theme.primary),
                    decoration: InputDecoration(
                      hintText: "Ingresa un texto",
                      hintStyle: KCustomTextStyle.kMedium(
                          context, pWidth * 0.30, theme.primary),
                      filled: true,
                      fillColor: Colors.white,
                      border: openSearch
                          ? const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, // Color del borde blanco
                              ),
                            )
                          : null,
                    ),
                    onChanged: (text) {
                      final int indexPage = ref.read(eventViewSelectedProvider);

                      if (text.isEmpty) {
                        if (pAppbarFilter == AppbarFilter.event) {
                          if (indexPage == 1) {
                            ref
                                .read(filterEventsProvider.notifier)
                                .update((state) => filterEvents);
                          } else if (indexPage == 2) {
                            ref.read(filterEventsProvider.notifier).update(
                                (state) => ref
                                    .read(eventsProvider)
                                    .where((event) =>
                                        event.modality ==
                                            ref
                                                .read(selectedModalityProvider)
                                                .name &&
                                        event.isImportanEvent == true)
                                    .toList());
                          }
                        } else if (pAppbarFilter == AppbarFilter.magazine) {
                          ref
                              .read(filterMagazineProvider.notifier)
                              .update((state) => filterMagazine);
                        }
                      } else {
                        if (pAppbarFilter == AppbarFilter.event) {
                          if (indexPage == 1) {
                            ref.read(filterEventsProvider.notifier).update(
                                (state) => filterEvents
                                    .where((event) => event.name
                                        .toLowerCase()
                                        .contains(text.toLowerCase()))
                                    .toList());
                          } else if (indexPage == 2) {
                            ref.read(filterEventsProvider.notifier).update(
                                (state) => filterEvents
                                    .where((event) =>
                                        event.name
                                            .toLowerCase()
                                            .contains(text.toLowerCase()) &&
                                        event.modality ==
                                            ref
                                                .read(selectedModalityProvider)
                                                .name &&
                                        event.isImportanEvent == true)
                                    .toList());
                          }
                        } else if (pAppbarFilter == AppbarFilter.magazine) {
                          ref.read(filterMagazineProvider.notifier).update(
                              (state) => filterMagazine
                                  .where((magazine) => magazine.name
                                      .toLowerCase()
                                      .contains(text.toLowerCase()))
                                  .toList());
                        }
                      }
                    },
                  )),
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: CustomCircleButton(
                    pAllowsSplash: true,
                    pOnTap: () {
                      ref
                          .read(openSearchProvider.notifier)
                          .update((state) => !openSearch);
                    },
                    pIconData: Icons.search,
                    pIconColor: theme.background,
                    pIconSize: pIconSize,
                    pButtonColor: theme.primary,
                    pBorderColor: theme.primary,
                    pWidth: pWidth,
                    pHeight: pHeight,
                    pRadius: 100,
                  )),
            ],
          ),
        ]),
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(pHeight);
}

TextEditingController _controller = TextEditingController();
