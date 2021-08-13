import 'package:flutter/material.dart';

import '../../../../models/article.dart';

class RecentlyAdded extends StatelessWidget {
  const RecentlyAdded({Key? key, required this.listArticle}) : super(key: key);

  final List<Article>? listArticle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(
                Icons.local_fire_department_outlined,
                color: Colors.orange,
                size: 24,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  'Recently added',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const Divider(
            thickness: 1,
            color: Colors.black87,
          ),
          Expanded(
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://drive.google.com/uc?id=${listArticle!.reversed.toList()[index].imageUrl.split("=")[1]}'),
                  ),
                  title: Text(
                    listArticle!.reversed.toList()[index].title,
                    style: const TextStyle(fontSize: 11),
                  ),
                  subtitle: Text(
                    listArticle!.reversed.toList()[index].story.split('.')[0],
                    style: const TextStyle(fontSize: 8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
