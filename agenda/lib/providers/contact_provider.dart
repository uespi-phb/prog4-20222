import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/contact.dart';

class ContactProvider with ChangeNotifier {
  final _baseUrl = 'https://agenda-8bc86-default-rtdb.firebaseio.com';
  final _collectionName = 'contacts';

  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  Future<void> loadContacts() async {
    final url = '$_baseUrl/$_collectionName.json';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Erro ao recuperar contatos');
    }

    final Map<String, dynamic> body = jsonDecode(response.body);

    body.forEach((id, data) {
      _contacts.add(Contact(
        id: id,
        name: data['name'],
        email: data['email'],
        phone: data['phone'],
      ));
    });
    notifyListeners();
  }

  Future<void> saveContact(ContactMap contact) async {
    if (contact['id'] == null) {
      await _addContact(contact);
    } else {
      await _updateContact(contact);
    }
  }

  Future<void> _addContact(ContactMap contact) async {
    final url = '$_baseUrl/$_collectionName.json';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(contact),
    );

    if (response.statusCode == HttpStatus.ok) {
      final data = jsonDecode(response.body);

      _contacts.add(Contact(
        id: data['name'],
        name: contact['name']!,
        email: contact['email']!,
        phone: contact['phone']!,
      ));
      notifyListeners();
    } else {
      throw Exception('Erro criando contato');
    }
  }

  Future<void> _updateContact(ContactMap contact) async {
    final id = contact['id']!;
    final url = '$_baseUrl/$_collectionName/$id.json';

    final response = await http.patch(
      Uri.parse(url),
      body: jsonEncode({
        'name': contact['name'],
        'email': contact['email'],
        'phone': contact['phone'],
      }),
    );

    if (response.statusCode == HttpStatus.ok) {
      final index = _contacts.indexWhere((contact) => contact.id == id);
      _contacts[index] = Contact(
        id: id,
        name: contact['name']!,
        email: contact['email']!,
        phone: contact['phone']!,
      );
      notifyListeners();
    } else {
      throw Exception('Erro atualizando contato');
    }
  }

  Future<void> deleteContact(String id) async {
    final url = '$_baseUrl/$_collectionName/$id.json';
    final response = await http.delete(
      Uri.parse(url),
    );
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Erro removendo contato');
    }
  }
}
