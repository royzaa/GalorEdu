import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galoredu/interface/footer.dart';

import '../../../../models/article.dart';
import '../about_mobile/about_mobile.dart';
import '../program_mobile/program_mobile.dart';
import './widgets/category/list_category_article.dart';
import './widgets/contributors/contribute_modal.dart';
import './widgets/contributors/top_contributors.dart';
import './widgets/recently_added.dart';
import '../../../footer.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key, required this.listArticle}) : super(key: key);

  final List<Article>? listArticle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    const choices = [
      {"page": "About", "route": AboutMobile()},
      {"page": "Home", "route": ''},
      {"page": "Program", "route": ProgramMobile()}
    ];

    const tabs = [
      "Kesehatan",
      "Pembelajaran",
      "Kreativitas",
      "Ekonomi",
      "Teknologi"
    ];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'GalorEdu',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            PopupMenuButton<dynamic>(
              itemBuilder: (context) {
                return choices
                    .map(
                      (item) => PopupMenuItem(
                        value: item["route"],
                        child: Text(item["page"] as String),
                      ),
                    )
                    .toList();
              },
            ),
          ],
          bottom: TabBar(
              physics: const BouncingScrollPhysics(),
              isScrollable: true,
              indicatorColor: Colors.green[300],
              labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.green),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
              tabs: tabs
                  .map((tab) => Tab(
                        text: tab,
                      ))
                  .toList()),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[300],
          child: const Icon(Icons.send_rounded),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              context: context,
              builder: (context) => const ContributeModal(),
            );
          },
        ),
        body: listArticle == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.menu_book_outlined,
                            color: Colors.green,
                            size: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              'Article',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20),
                      child: Divider(
                        thickness: 1,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.width * 1 / 3,
                      child: TabBarView(children: [
                        ListCategoryArticle(
                            listArticle: listArticle,
                            category: Category.kesehatan),
                        ListCategoryArticle(
                            listArticle: listArticle,
                            category: Category.pembelajaran),
                        ListCategoryArticle(
                            listArticle: listArticle,
                            category: Category.kreativitas),
                        ListCategoryArticle(
                            listArticle: listArticle,
                            category: Category.ekonomi),
                        ListCategoryArticle(
                            listArticle: listArticle,
                            category: Category.teknologi),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TopContributtors(listArticle: listArticle),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 300,
                      width: size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: RecentlyAdded(listArticle: listArticle),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Footer(),
                  ],
                ),
              ),
      ),
    );
  }
}
