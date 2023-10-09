import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:revistabike_app/presentation/screens/00-screens.dart';

final GoRouter appRouter = GoRouter(initialLocation: '/', routes: <RouteBase>[
  GoRoute(
      path: '/',
      redirect: (BuildContext context, GoRouterState state) =>
          '/loading-initial'),
  GoRoute(
      path: '/loading-initial',
      name: SplashScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      }),
  GoRoute(
      path: '/menu-options',
      name: MenuOptionsScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const MenuOptionsScreen();
      }),
  GoRoute(
    path: '/home-event',
    name: PrincipalEventScreen.name,
    builder: (context, state) {
      return const PrincipalEventScreen();
    },
  ),
  GoRoute(
      path: '/poster-event',
      name: PosterEventScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const PosterEventScreen();
      }),
  GoRoute(
      path: '/location-map',
      name: LocationMapScreen.name,
      builder: (BuildContext context, GoRouterState state) {
        return const LocationMapScreen();
      }),
  GoRoute(
    path: '/home-magazine',
    name: PrincipalMagazineScreen.name,
    builder: (context, state) {
      return const PrincipalMagazineScreen();
    },
  ),
  GoRoute(
    path: '/magazine',
    name: MagazineScreen.name,
    builder: (context, state) {
      return const MagazineScreen();
    },
  ),
]);
