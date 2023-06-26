import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_images.dart';
import '../models/contact.dart';
import '../providers/contact_provider.dart';

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
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final ContactMap _contactData = {};

  bool _isLoading = false;

  Contact? get contact => widget.contact;

  @override
  void initState() {
    super.initState();
    _nameController.text = contact?.name ?? '';
    _emailController.text = contact?.email ?? '';
    _phoneController.text = contact?.phone ?? '';
  }

  Future<void> _showError(String error) {
    return showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Erro'),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  Future<void> _saveContact() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (contact != null) {
      _contactData['id'] = contact!.id;
    }

    _contactData['name'] = _nameController.text.trim();
    _contactData['email'] = _emailController.text.trim();
    _contactData['phone'] = _phoneController.text.trim();

    try {
      setState(() => _isLoading = true);
      final provider = Provider.of<ContactProvider>(context, listen: false);
      await provider.saveContact(_contactData);
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } catch (error) {
      await _showError('Ocorreu um erro ao salvar o contato.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  String? isNotEmpty(String? text) {
    if ((text == null) || text.isEmpty) {
      return 'Este campo é obrigatório';
    }
    return null;
  }

  String? isEmail(String? text) {
    final error = isNotEmpty(text);
    if (error != null) {
      return error;
    }
    if (!(text!.contains('@'))) {
      return 'E-mail inválido';
    }

    return null;
  }

  String? isPhoneNumber(String? text) {
    final error = isNotEmpty(text);
    if (error != null) {
      return error;
    }
    if (int.tryParse(text!) == null) {
      return 'Número de telefone inválido';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text((contact == null) ? 'Novo Contato' : 'Editar Contato'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveContact,
        child: const Icon(Icons.save),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                          decoration: const InputDecoration(
                            labelText: 'Nome',
                          ),
                          validator: isNotEmpty,
                          controller: _nameController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'E-mail',
                          ),
                          validator: isEmail,
                          controller: _emailController,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Telefone',
                          ),
                          validator: isPhoneNumber,
                          controller: _phoneController,
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
