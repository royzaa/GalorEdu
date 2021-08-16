import 'package:flutter/material.dart';

import '../../../../models/article.dart';
import '../../blog _screen/blog_sceen.dart';

class RecentlyAdded extends StatelessWidget {
  const RecentlyAdded({Key? key, required this.listArticle}) : super(key: key);

  final List<Article>? listArticle;

  @override
  Widget build(BuildContext context) {
    var listReversed = listArticle!.reversed.toList();
    return Container(
      height: 350,
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
              Flexible(
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
          Flexible(
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlogScreen(
                            imageSource: listReversed[index].imaageSrc,
                            imageUrl:
                                'https://drive.google.com/uc?id=${listReversed[index].imageUrl.split("=")[1]}',
                            tags: listReversed[index].tags,
                            title: listReversed[index].title,
                            htmlStory: listReversed[index].storyInHtml,
                            timeStamp: listReversed[index].time,
                            author: listReversed[index].author,
                            linkYt: listReversed[index].linkYt),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://drive.google.com/uc?id=${listReversed[index].imageUrl.split("=")[1]}'),
                  ),
                  title: Text(
                    listReversed[index].title,
                    style: const TextStyle(fontSize: 11),
                  ),
                  subtitle: Text(
                    listReversed[index].story.split('.')[0],
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
