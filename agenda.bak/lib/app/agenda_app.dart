import 'package:agenda/providers/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_route.dart';
import '../pages/main_page.dart';
import '../pages/contact_page.dart';
import '../models/contact.dart';

class AgendaApp extends StatelessWidget {
  const AgendaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agenda',
        theme: ThemeData(
          colorSchemeSeed: Colors.pink,
        ),
        initialRoute: AppRoute.home.name,
        routes: {
          AppRoute.home.name: (_) => const MainPage(),
          AppRoute.newContact.name: (context) {
            final contact =
                ModalRoute.of(context)?.settings.arguments as Contact?;
            return ContactPage(
              contact: contact,
            );
          },
        },
      ),
    );
  }
}
