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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<ContactProvider>(context, listen: false);
    provider.loadContacts().then((_) {
      setState(() => _isLoading = false);
    }).catchError((error) {
      _showErrorDialog(error.toString());
      setState(() => _isLoading = false);
    });
  }

  Future<void> _showErrorDialog(String message) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Erro'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ContactProvider>(context, listen: true);
    final contacts = provider.contacts;

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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: GlobalKey(),
                  child: ContactTile(contacts[index]),
                  confirmDismiss: (_) {
                    return showDialog<bool>(
                      context: context,
                      builder: (ctx) {
                        return AlertDialog(
                          title: const Text('Confirmação'),
                          content: const Text('Confirma a remoção do contato?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop<bool>(ctx, true);
                              },
                              child: const Text('Sim'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop<bool>(ctx, false);
                              },
                              child: const Text('Não'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  onDismissed: (_) {
                    final provider =
                        Provider.of<ContactProvider>(context, listen: false);
                    provider.deleteContact(contacts[index].id);
                  },
                );
              },
            ),
    );
  }
}
