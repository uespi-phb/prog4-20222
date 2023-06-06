import 'package:flutter/material.dart';

import '../app/app_images.dart';
import '../models/contact.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  const ContactPage({
    super.key,
    this.contact,
  });

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();

  void _saveContact() {
    _formKey.currentState?.validate();
  }

  String? isNotEmpty(String? text) {
    if ((text == null) || text.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  String? isEmail(String? text) {
    if (isNotEmpty(text) == null) {
      if (!text!.contains('@')) {
        return 'E-mail inválido';
      }
    }

    return null;
  }

  String? isPhoneNumber(String? text) {
    if (isNotEmpty(text) == null) {
      if (int.tryParse(text!) == null) {
        return 'Número de telefone inválido';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveContact,
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80.0),
              child: Image.asset(
                AppImages.person,
                width: 120.0,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    initialValue: 'Fulano de Tal',
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                    ),
                    validator: isNotEmpty,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'E-mail',
                    ),
                    validator: isEmail,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Telefone',
                    ),
                    validator: isPhoneNumber,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
