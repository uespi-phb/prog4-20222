import 'package:agenda/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_route.dart';
import '../widgets/contact_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();

    debugPrint('initState()');
    final provider = Provider.of<ContactProvider>(context, listen: false);
    provider.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context, listen: true);
    final contacts = provider.contacts;

    debugPrint('build(): $contacts');

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
        itemCount: contacts.length,
        itemBuilder: (context, index) => ContactTile(contacts[index]),
      ),
    );
  }
}
