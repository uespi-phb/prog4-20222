import 'package:flutter/material.dart';
import 'package:meals/pages/favorites_page.dart';
import 'package:meals/widgets/app_drawer.dart';

import './category_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _pageIndex = 0;

  Widget _createPage(int index) {
    Widget page;

    if (index == 0) {
      page = const CategoryPage();
    } else {
      page = const FavoritesPage();
    }
    return page;
  }

  Widget _createTitle(int index) {
    Widget title;

    if (index == 0) {
      title = const Text('Categorias');
    } else {
      title = const Text('Favoritos');
    }
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _createTitle(_pageIndex),
        centerTitle: true,
      ),
      drawer: const AppDrawer(),
      body: _createPage(_pageIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        currentIndex: _pageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
    );
  }
}
