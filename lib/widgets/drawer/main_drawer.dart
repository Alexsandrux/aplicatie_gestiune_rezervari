import 'package:flutter/material.dart';
import './drawer_button_tile.dart';

import '../../screens/settings_screen.dart';
import '../../screens/news_screen.dart';
import '../../screens/camere_screen.dart';
import '../../screens/roads_and_location.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Image.asset('lib/assets/pictures/mountains.png'),
          const DrawerButtonTile(
            titlu: "Acasă",
            icon: Icon(Icons.home),
            screenRoute: "/",
          ),
          const DrawerButtonTile(
            titlu: "Rezervă cameră",
            icon: Icon(Icons.card_travel),
            screenRoute: CamereScreen.routeName,
          ),
          const DrawerButtonTile(
            titlu: "Știri",
            icon: Icon(Icons.newspaper),
            screenRoute: NewsScreen.routeName,
          ),
          const DrawerButtonTile(
            titlu: "Stare drumuri și locație",
            icon: Icon(Icons.map),
            screenRoute: RoadsAndLocation.routeName,
          ),
          const Spacer(
            flex: 1,
          ),
          const DrawerButtonTile(
            titlu: "Setări",
            icon: Icon(Icons.settings),
            screenRoute: SettingsScreen.routeName,
          ),
        ],
      ),
    );
  }
}
