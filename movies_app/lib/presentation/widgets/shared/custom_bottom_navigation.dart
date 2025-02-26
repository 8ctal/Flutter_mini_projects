import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavigation({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    // context.go('');
    switch (index) {
      case 0:
        context.go('/home/0');
        break;

      case 1:
        context.go('/home/1');
        break;

      case 2:
        context.go('/home/2');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    return NavigationBar(
        elevation: 0,
        indicatorColor: colors.inversePrimary,
        backgroundColor: colors.surface,
        height: size.height * 0.1,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: currentIndex,
        onDestinationSelected: (value) => onItemTapped(context, value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_max), label: 'Inicio'),
          NavigationDestination(
              icon: Icon(Icons.label_outline), label: 'Categorías'),
          NavigationDestination(
              icon: Icon(Icons.favorite_outline), label: 'Favoritos'),
        ]);
  }
}
