import 'package:flutter/material.dart';
//import 'package:flutter_application_4/screens/tabs_screen.dart';
//import 'package:flutter_application_4/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter { glutenfree, lactosefree, vegan, vegetarian }

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenfreefilter = false;
  bool _isvegan = false;
  bool _isvegetarian = false;
  bool _islactosefree = false;

  @override
  void initState() {
    super.initState();
    _glutenfreefilter = widget.currentFilters[Filter.glutenfree]!;
    _islactosefree = widget.currentFilters[Filter.lactosefree]!;
    _isvegan = widget.currentFilters[Filter.vegan]!;
    _isvegetarian = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      // drawer: MainDrawer(onSelectScreen: (identifier) {
      //   Navigator.of(context).pop();
      //   if (identifier == 'meals') {
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (ctx) => const TabsScreen()));
      //   }
      // }),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenfreefilter,
            Filter.lactosefree: _islactosefree,
            Filter.vegan: _isvegan,
            Filter.vegetarian: _isvegetarian
          });
          return false;
        },
        child: Column(
          children: [
            onSwitchListTile(
                context, 'Gluten-free', 'Only include gluten-free meals',
                (bool value) {
              setState(() {
                _glutenfreefilter = value;
              });
            }, _glutenfreefilter),
            onSwitchListTile(
                context, 'Lactose-free', 'Only include lactose-free meals',
                (bool value) {
              setState(() {
                _islactosefree = value;
              });
            }, _islactosefree),
            onSwitchListTile(context, 'Vegan', 'Only include vegan meals',
                (bool value) {
              setState(() {
                _isvegan = value;
              });
            }, _isvegan),
            onSwitchListTile(
                context, 'Vegetarian', 'Only include vegetarian meals',
                (bool value) {
              setState(() {
                _isvegetarian = value;
              });
            }, _isvegetarian)
          ],
        ),
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
