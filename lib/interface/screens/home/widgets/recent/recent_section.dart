import 'package:flutter/material.dart';

import './recent_item.dart';
import '../../../../../models/article.dart';

class RecentSection extends StatelessWidget {
  const RecentSection({Key? key, required this.listArticle}) : super(key: key);

  final List<Article>? listArticle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int _currentRecentIndex = 1;
    final PageController _pageController = PageController();

    final int totalArticle = listArticle!.length;

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

    return InkWell(
      onTap: () {},
      child: SizedBox(
        height: size.height * 1 / 4.5,
        width: size.width * 2 / 3 * 3 / 5 - 30,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              itemCount: listArticle!.length,
              onPageChanged: (index) {
                _currentRecentIndex = index;
              },
              controller: _pageController,
              itemBuilder: (context, index) => RecentItem(
                listArticle: listArticle,
                articleIndex: index,
                tagColor: Colors.black,
              ),
            ),
            FittedBox(
              child: Row(
                children: [
                  InkWell(
                    onTap: prevPage,
                    child: Container(
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
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
                      color: const Color.fromRGBO(0, 0, 0, 0.2),
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
    );
  }
}
