import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../models/article.dart';

class TopContributtors extends StatefulWidget {
  const TopContributtors({Key? key, required this.listArticle})
      : super(key: key);

  final List<Article>? listArticle;

  @override
  State<TopContributtors> createState() => _TopContributtorsState();
}

class _TopContributtorsState extends State<TopContributtors> {
  final List<Map<String, dynamic>> topContributors = [];

  void sortEmail() {
    for (var article in widget.listArticle!) {
      if (!topContributors
          .any((element) => element.containsValue(article.author))) {
        topContributors.add({'author': article.author, 'amount': 1});
      }
    }

    for (var article in widget.listArticle!) {
      if (topContributors
          .any((element) => element.containsValue(article.author))) {
        for (var contributor in topContributors) {
          if (contributor.containsValue(article.author)) {
            contributor['amount'] += 1;
          }
        }
      }
    }
    topContributors.sort((a, b) => b['amount'].compareTo(a['amount']));
    print('top pengguna: $topContributors');
  }

  @override
  void initState() {
    print('panjang: ${widget.listArticle!.length}');
    sortEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.insert_chart_rounded,
                color: Colors.pink,
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Top Contributors',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black87,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: const Icon(
                    Icons.person,
                    size: 14,
                  ),
                ),
                title: Text(
                  '@' + topContributors[index]['author'],
                  style: const TextStyle(fontSize: 11),
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Submit blog',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 20)),
            ),
          )
        ],
      ),
    );
  }
}
