import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});
  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primaryContainer.withOpacity(.8)
              ])),
              child: Row(children: [
                Icon(Icons.fastfood,
                    size: 45, color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 18),
                Text("Cooking up...",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
              ])),
          ListTile(
              onTap: () {
                onSelectScreen('meals');
              },
              leading: Icon(
                Icons.restaurant,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              title: Text("Meals",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary))),
          ListTile(
              onTap: () {
                onSelectScreen('filters');
              },
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              title: Text("Filters",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary))),
        ],
      ),
    );
  }
}
