import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../interface/Theme/my_text_theme.dart';

class Contents extends StatelessWidget {
  const Contents({
    Key? key,
    required this.constraints,
    required this.imageSource,
    required this.imageUrl,
    required this.tags,
    required this.title,
    required this.htmlStory,
    required this.timeStamp,
    required this.author,
    required this.linkYt,
  }) : super(key: key);
  final Size constraints;
  final String imageUrl;
  final String title;
  final String tags;
  final String imageSource;
  final String htmlStory;
  final String timeStamp;
  final String author;
  final String linkYt;

  @override
  Widget build(BuildContext context) {
    // String getPostDate() {
    //   print('time:' + timeStamp);
    //   String? postDate;

    //   var splitByTimeUnit = timeStamp.split('/');

    //   int monthInNumber = int.parse(splitByTimeUnit[1]);

    //   String month = '';

    //   switch (monthInNumber) {
    //     case 1:
    //       month = 'Januari';
    //       break;
    //     case 2:
    //       month = 'Februari';
    //       break;
    //     case 3:
    //       month = 'Maret';
    //       break;
    //     case 4:
    //       month = 'April';
    //       break;
    //     case 5:
    //       month = 'Mei';
    //       break;
    //     case 6:
    //       month = 'Juni';
    //       break;
    //     case 7:
    //       month = 'Juli';
    //       break;
    //     case 8:
    //       month = 'Agustus';
    //       break;
    //     case 9:
    //       month = 'September';
    //       break;
    //     case 10:
    //       month = 'Oktober';
    //       break;
    //     case 11:
    //       month = 'November';
    //       break;
    //     case 12:
    //       month = 'Desember';
    //       break;
    //     default:
    //       month = 'Desember';
    //   }

    //   postDate = splitByTimeUnit[0] + month + splitByTimeUnit[2];
    //   print('post date:' + postDate);
    //   return postDate;
    // }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: constraints.width < 550
              ? 20
              : constraints.width < 950
                  ? constraints.width * 1 / 15
                  : constraints.width * 1 / 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: tags
                .split(',')
                .map(
                  (tag) => FittedBox(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                            color: Colors.green.shade600,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: MyTextTheme.appBarMenu,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            author,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
          // Text(
          //   getPostDate(),
          //   style: const TextStyle(fontSize: 12, color: Colors.grey),
          // ),
          const SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Image.network(
                  'https://drive.google.com/uc?id=${imageUrl.split("=")[1]}'),
              Positioned(
                top: -15,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[300],
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Text(
            imageSource,
            style: const TextStyle(
                color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 12),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
                right: constraints.width < 950
                    ? constraints.width * 1 / 3.25
                    : constraints.width * 1 / 4.5),
            child: Html(
              shrinkWrap: true,
              data: htmlStory,
              onLinkTap: (url, context, attribute, element) async {
                await canLaunch(url!)
                    ? await launch(url)
                    : throw 'Could\'nt launch the url: $url';
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          linkYt == ''
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.width * 1 / 8),
                  child: const Text(
                      'Untuk menambah wawasan kita tentang topik di atas ayo tonton video ini!'),
                ),
          const SizedBox(
            height: 20,
          ),
          linkYt == ''
              ? const SizedBox()
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.width * 1 / 8),
                  child: Html(
                      data:
                          """<iframe width="560" height="315" src="https://www.youtube.com/embed/${linkYt.split('/')[3].split('=')[1]}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""),
                )
        ],
      ),
    );
  }
}
