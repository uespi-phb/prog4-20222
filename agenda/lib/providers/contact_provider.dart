import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/contact.dart';

class ContactProvider with ChangeNotifier {
  final _baseUrl = 'https://agenda-8bc86-default-rtdb.firebaseio.com';

  final List<Contact> _contacts = [];

  List<Contact> get contacts => _contacts;

  void loadContacts() {
    final url = '$_baseUrl/contacts.json';

    final future = http.get(Uri.parse(url));
    future.then((response) {
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
    });
  }

  Future<void> saveContact(ContactMap contact) {
    if (contact['id'] == null) {
      return _addContact(contact);
    } else {
      return _updateContact(contact);
    }
  }

  Future<void> _addContact(ContactMap contact) {
    final url = '$_baseUrl/contacts.json';
    return http.post(
      Uri.parse(url),
      body: jsonEncode(contact),
    );
  }

  Future<void> _updateContact(ContactMap contact) {
    final id = contact['id'];
    final url = '$_baseUrl/contacts/$id.json';
    return http.patch(
      Uri.parse(url),
      body: jsonEncode({
        'name': contact['name'],
        'email': contact['email'],
        'phone': contact['phone'],
      }),
    );
  }
}
