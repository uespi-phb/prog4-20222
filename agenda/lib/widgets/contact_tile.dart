import 'package:flutter/material.dart';

import '../app/app_images.dart';
import '../app/app_route.dart';
import '../models/contact.dart';

class ContactTile extends StatelessWidget {
  final Contact contact;

  const ContactTile(
    this.contact, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        leading: Image.asset(AppImages.person),
        title: Text(contact.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.phone),
            Text(contact.email),
          ],
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoute.newContact.name,
            arguments: contact,
          );
        },
      ),
    );
  }
}
