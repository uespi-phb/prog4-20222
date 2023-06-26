import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_route.dart';
import '../providers/contact_provider.dart';
import '../widgets/contact_tile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<ContactProvider>(context, listen: false);
    provider.loadContacts().then((_) {
      setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final contacts =
        Provider.of<ContactProvider>(context, listen: true).contacts;

    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
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
