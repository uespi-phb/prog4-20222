import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/meals_provider.dart';
import '../widgets/app_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<MealsProvider>(context, listen: false);

    print('****build()');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Filtros',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            Consumer<MealsProvider>(
              builder: (_, provider, __) => SwitchListTile(
                value: provider.settings.isGlutenFree,
                title: const Text('Sem Glútem'),
                subtitle: const Text('Só exibe refeições sem glúten'),
                onChanged: (flag) {
                  provider.toggleGlutenFree();
                },
              ),
            ),
            Consumer<MealsProvider>(
              builder: (_, provider, __) => SwitchListTile(
                value: provider.settings.isLactoseFree,
                title: const Text('Sem Lactose'),
                subtitle: const Text('Só exibe refeições sem lactose'),
                onChanged: (flag) {
                  provider.toggleLactoseFree();
                },
              ),
            ),
            Consumer<MealsProvider>(
              builder: (_, provider, __) => SwitchListTile(
                value: provider.settings.isVegetarian,
                title: const Text('Vegetariano'),
                subtitle: const Text('Só exibe refeições vegetarianas'),
                onChanged: (flag) {
                  provider.toggleVegetarian();
                },
              ),
            ),
            Consumer<MealsProvider>(
              builder: (_, provider, __) => SwitchListTile(
                value: provider.settings.isVegan,
                title: const Text('Vegano'),
                subtitle: const Text('Só exibe refeições veganas'),
                onChanged: (flag) {
                  provider.toggleVegan();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
