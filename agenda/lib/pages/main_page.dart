import 'package:flutter/material.dart';

import '../app/app_route.dart';
import '../models/data.dart';
import '../widgets/contact_tile.dart';

class MainPage extends StatelessWidget {
  final _contactData = kContactData;

  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoute.newContact.name);
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: ListView.builder(
        itemCount: _contactData.length,
        itemBuilder: (context, index) => ContactTile(_contactData[index]),
      ),
    );
  }
}
