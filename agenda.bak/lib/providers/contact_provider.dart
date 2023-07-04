import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/contact.dart';

class ContactProvider with ChangeNotifier {
  final _baseUrl = 'https://agenda-8bc86-default-rtdb.firebaseio.com';

  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  Future<void> loadContacts() async {
    final response = await http.get(Uri.parse('$_baseUrl/contacts.json'));

    debugPrint(response.body);

    Map<String, dynamic> contactData = jsonDecode(response.body);

    contactData.forEach((id, data) {
      _contacts.add(Contact(
        id: id,
        name: data['name']!,
        email: data['email']!,
        phone: data['phone']!,
      ));
    });
    notifyListeners();
  }

  Future<void> saveContact(ContactMap contact) async {
    if (contact['id'] == null) {
      return await _addContact(contact);
    } else {
      return await _updateContact(contact);
    }
  }

  Future<void> _addContact(ContactMap contact) async {
    final url = '$_baseUrl/contacts.json';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(contact),
    );
    if (response.statusCode == HttpStatus.ok) {
      final body = jsonDecode(response.body);
      _contacts.add(Contact(
        id: body['name'],
        name: contact['name']!,
        email: contact['email']!,
        phone: contact['phone']!,
      ));
      notifyListeners();
    } else if (response.statusCode >= HttpStatus.badRequest) {
      throw Exception('Erro ao criar novo contato.');
    }
  }

  Future<void> _updateContact(ContactMap contact) async {
    final id = contact['id'];
    final url = '$_baseUrl/contacts/$id.json';
    final response = await http.patch(
      Uri.parse(url),
      body: jsonEncode({
        'name': contact['name'],
        'email': contact['email'],
        'phone': contact['phone'],
      }),
    );
    if (response.statusCode >= 400) {
      throw Exception('Erro ao atualizar contato.');
    }
    notifyListeners();
  }
}
