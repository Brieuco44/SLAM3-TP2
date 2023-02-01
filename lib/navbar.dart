import 'package:flutter/material.dart';
import 'package:dice_icons/dice_icons.dart';
import 'compteBody.dart';
import 'operationBody.dart';
import 'listede.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentPageIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const compteBody();
      case 1:
        return const operationBody();
      case 2:
        return const listede();
      default:
        return const Text("Erreur de page");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: _getDrawerItemWidget(currentPageIndex),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Accueil',
            ),
            NavigationDestination(
              selectedIcon: Text("="),
              icon: Icon(Icons.start),
              label: 'Page suivante',
            ),
            NavigationDestination(
              selectedIcon: Icon(DiceIcons.dice1),
              icon: Icon(DiceIcons.dice6),
              label: 'parametres',
            ),
          ],
        ));
  }
}
