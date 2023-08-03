import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs.dart';
import 'package:meals_app/widgets/main_drawer.dart';

enum Filter{
  glutenFree,
  lactosFree,
  vagetarian,
  vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _glutenFreeFilterSet = false;
  var _lactosFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

@override
  void initState() {
    _glutenFreeFilterSet=widget.currentFilters[Filter.glutenFree]!;
    _lactosFreeFilterSet=widget.currentFilters[Filter.lactosFree]!;
    _vegetarianFilterSet=widget.currentFilters[Filter.vagetarian]!;
    _veganFilterSet=widget.currentFilters[Filter.vegan]!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // drawer: MainDrawer(onSelectScreen: ((identifier){
      //   Navigator.of(context).pop();
      //   if(identifier=='meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> const TabsScreen()));
      //   }
      // } )),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactosFree: _lactosFreeFilterSet,
            Filter.vagetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet=isChecked;
                });
              },
              title: Text(
                'Glutan-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
            SwitchListTile(
              value: _lactosFreeFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _lactosFreeFilterSet=isChecked;
                });
              },
              title: Text(
                'lactos-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactos-free meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
            SwitchListTile(
              value: _vegetarianFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet=isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include Vegetarian meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
      
            SwitchListTile(
              value: _veganFilterSet,
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet=isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
