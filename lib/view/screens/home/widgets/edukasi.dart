import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:palette_generator/palette_generator.dart';

import '../../../../models/article.dart';
import './recent_item.dart';
import './grid_category_articles.dart';

class Edukasi extends StatefulWidget {
  const Edukasi({
    Key? key,
    required this.size,
    required this.listArticle,
  }) : super(key: key);

  final Size size;
  final List<Article>? listArticle;

  @override
  State<Edukasi> createState() => _EdukasiState();
}

class _EdukasiState extends State<Edukasi> with TickerProviderStateMixin {
  final List<PaletteColor> _colors = [];
  final PageController _pageController = PageController();

  @override
  void initState() {
    _updateColors();

    super.initState();
  }

  Future<void> _updateColors() async {
    for (var article in widget.listArticle!) {
      final PaletteGenerator generator =
          await PaletteGenerator.fromImageProvider(
        const AssetImage('assets/images/logo_kab.png'),
      );
      _colors.add(generator.darkMutedColor == null
          ? PaletteColor(Colors.black, 3)
          : generator.darkMutedColor!);
    }
    print('jumlah color: $_colors');
  }

  int _currentRecentIndex = 1;

  @override
  Widget build(BuildContext context) {
    final int totalArticle = widget.listArticle!.length;
    final TabController _tabController = TabController(length: 5, vsync: this);

    void nextPage() {
      _currentRecentIndex <= totalArticle
          ? _pageController.nextPage(
              duration: const Duration(milliseconds: 250), curve: Curves.easeIn)
          : _pageController.initialPage;
    }

    void prevPage() {
      if (_currentRecentIndex > 0) {
        _pageController.previousPage(
            duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
      }
    }

    return Container(
      height: widget.size.height * 0.8,
      width: widget.size.width * 2 / 3,
      padding: EdgeInsets.symmetric(
          horizontal: widget.size.width * 1 / 6, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: widget.size.height * 0.8,
              width: widget.size.width * 2 / 3 * 2 / 3 - 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: widget.size.height * 1 / 4.5,
                      width: widget.size.width * 2 / 3 * 3 / 5 - 30,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          PageView.builder(
                            itemCount: widget.listArticle!.length,
                            onPageChanged: (index) {
                              _currentRecentIndex = index;
                            },
                            controller: _pageController,
                            itemBuilder: (context, index) => RecentItem(
                              listArticle: widget.listArticle,
                              articleIndex: index,
                              tagColor: _colors.isEmpty
                                  ? Colors.amber
                                  : _colors[index].color,
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: prevPage,
                                  child: Container(
                                    color: const Color.fromRGBO(0, 0, 0, 0.1),
                                    padding: const EdgeInsets.all(2.0),
                                    child: const Icon(
                                      Icons.arrow_left_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: nextPage,
                                  child: Container(
                                    color: const Color.fromRGBO(0, 0, 0, 0.1),
                                    padding: const EdgeInsets.all(2.0),
                                    child: const Icon(
                                      Icons.arrow_right_rounded,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: widget.size.width * 2 / 3 * 3 / 5 - 30,
                    // height: widget.size.height * 0.5,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TabBar(
                          labelStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                          unselectedLabelStyle: const TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w400),
                          tabs: const [
                            Tab(
                              text: 'Kesehatan',
                            ),
                            Tab(
                              text: 'Pembelajaran',
                            ),
                            Tab(
                              text: 'Kreativitas',
                            ),
                            Tab(
                              text: 'Ekonomi',
                            ),
                            Tab(
                              text: 'Teknologi',
                            )
                          ],
                          controller: _tabController,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: widget.size.width * 2 / 3 * 2 / 3 - 20,
                          height: widget.size.height * 0.4,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              GridCategoryArticles(
                                  listArticle: widget.listArticle,
                                  category: Category.kesehatan),
                              GridCategoryArticles(
                                  listArticle: widget.listArticle,
                                  category: Category.pembelajaran),
                              GridCategoryArticles(
                                  listArticle: widget.listArticle,
                                  category: Category.kreativitas),
                              GridCategoryArticles(
                                  listArticle: widget.listArticle,
                                  category: Category.ekonomi),
                              GridCategoryArticles(
                                  listArticle: widget.listArticle,
                                  category: Category.pembelajaran)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: widget.size.width * 2 / 3 * 1 / 3 - 20,
            height: widget.size.height * 0.35,
          )
        ],
      ),
    );
  }
}
