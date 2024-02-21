import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_application_4/screens/tabs_screen.dart';
//import 'package:flutter_application_4/widgets/main_drawer.dart';
import 'package:flutter_application_4/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          onSwitchListTile(
              context, 'Gluten-free', 'Only include gluten-free meals',
              (bool value) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.glutenFree, value);
          }, activeFilters[Filter.glutenFree]),
          onSwitchListTile(
              context, 'Lactose-free', 'Only include lactose-free meals',
              (bool value) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, value);
          }, activeFilters[Filter.lactoseFree]),
          onSwitchListTile(context, 'Vegan', 'Only include vegan meals',
              (bool value) {
            ref.read(filtersProvider.notifier).setFilter(Filter.vegan, value);
          }, activeFilters[Filter.vegan]),
          onSwitchListTile(
              context, 'Vegetarian', 'Only include vegetarian meals',
              (bool value) {
            ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegetarian, value);
          }, activeFilters[Filter.vegetarian])
        ],
      ),
    );
  }

  SwitchListTile onSwitchListTile(BuildContext context, title, subtitle,
      Function(bool newValue) onChanged, filter) {
    return SwitchListTile(
      title: Text(title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary)),
      subtitle: Text(subtitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.primary)),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      value: filter,
      onChanged: onChanged,
    );
  }
}
