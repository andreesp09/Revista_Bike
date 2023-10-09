import 'package:flutter/material.dart';
import 'package:revistabike_app/presentation/views/00-views.dart';

class AppViewsRoutes {
  List<Widget> principalMenuOptionView() {
    return <Widget>[
      const MenuItemEventsView(),
      const MenuMagazinesEventsView(),
      const MenuItemRoutesView(),
      const MenuItemSponsorView()
    ];
  }

  List<Widget> homeEventsViews() {
    return <Widget>[
      const HomeEventsView(),
      const ListAllEventsView(),
      const PreferredEventsView(),
      const SelectedEventsView()
    ];
  }
}
