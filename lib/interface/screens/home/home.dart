import 'package:flutter/material.dart';

import '../../../models/article.dart';
import './widgets/app_bar.dart' as app_bar;
import './widgets/edukasi.dart';
import '../mobile/main_mobile.dart';
import '../../footer.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.listArticle}) : super(key: key);
  final List<Article>? listArticle;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final TabController _tabController =
        TabController(length: 3, vsync: this, initialIndex: 1);

    return widget.listArticle == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : size.width < 800
            ? MainMobile(listArticle: widget.listArticle)
            : Scaffold(
                backgroundColor: Colors.transparent,
                body: SingleChildScrollView(
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
                              isScrollable: true,
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
                              unselectedLabelStyle:
                                  const TextStyle(fontSize: 11),
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
                          child:
                              TabBarView(controller: _tabController, children: [
                            const Center(
                              child: Text('Belum ada pengumuman'),
                            ),
                            Edukasi(
                              listArticle: widget.listArticle,
                            ),
                            const Center(
                              child: Text('Belum ada reportase'),
                            )
                          ]),
                        ),
                        const Footer()
                      ],
                    ),
                  ),
                ),
              );
  }
}
