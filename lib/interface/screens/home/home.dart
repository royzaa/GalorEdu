import 'package:flutter/material.dart';

import '../../../services/sheets_api.dart';
import '../../../models/article.dart';
import './widgets/app_bar.dart' as app_bar;
import './widgets/edukasi.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  List<Article>? _article;

  @override
  void initState() {
    SheetApi.getAllRow().then((value) {
      _article = value;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: _article == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SizedBox(
                // height: size.height * 2,
                width: size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    app_bar.AppBar(size: size),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 20),
                      alignment: Alignment.center,
                      width: size.width * 2 / 5,
                      height: 64,
                      child: TabBar(
                          controller: _tabController,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                            color: Colors.green[400],
                          ),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 30),
                          labelColor: Colors.white,
                          labelStyle: const TextStyle(fontSize: 13),
                          unselectedLabelColor: Colors.black,
                          unselectedLabelStyle: const TextStyle(fontSize: 11),
                          tabs: const [
                            Tab(
                              text: 'Pengumuman',
                            ),
                            Tab(
                              text: 'Edukasi',
                            ),
                            Tab(text: 'Reportase')
                          ]),
                    ),
                    Container(
                      height: size.height * 1,
                      width: size.width,
                      color: Colors.grey.shade200,
                      child: TabBarView(controller: _tabController, children: [
                        const Center(
                          child: Text('Belum ada pengumuman'),
                        ),
                        Edukasi(
                          listArticle: _article,
                        ),
                        const Center(
                          child: Text('Belum ada reportase'),
                        )
                      ]),
                    ),
                    Container(
                      color: Colors.black87,
                      width: size.width,
                      height: size.height * 0.15,
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                          child: const Text(
                            'Purbalingga Lor - 2021',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
