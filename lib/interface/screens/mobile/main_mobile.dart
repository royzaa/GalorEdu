import 'package:flutter/material.dart';

import '../../../models/article.dart';
import './home_mobile/home_mobile.dart';
import './pengumuman.dart';
import './reportase.dart';

class MainMobile extends StatefulWidget {
  const MainMobile({Key? key, required this.listArticle}) : super(key: key);
  final List<Article>? listArticle;

  @override
  State<MainMobile> createState() => _MainMobileState();
}

class _MainMobileState extends State<MainMobile> {
  List<Widget>? _pages;

  @override
  void initState() {
    _pages = [
      HomeMobile(listArticle: widget.listArticle),
      const Pengumuman(),
      const Reportase()
    ];
    super.initState();
  }

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedIconTheme: IconThemeData(color: Colors.green[300], size: 26),
        selectedLabelStyle: TextStyle(color: Colors.green[300]),
        elevation: 40,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            label: "Pengumuman",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: "Reportase",
          ),
        ],
      ),
      body: _pages![_selectedIndex],
    );
  }
}
