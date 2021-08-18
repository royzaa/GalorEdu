class Article {
  final String imageUrl;
  final String imaageSrc;
  final String story;
  final String storyInHtml;
  final String topic;
  final String tags;
  final String title;
  final String format;
  final String author;
  final String email;
  final int clickCount;
  final String time;
  final String linkYt;
  final String? programType;

  Article(
      {required this.imageUrl,
      required this.author,
      required this.email,
      required this.title,
      required this.tags,
      required this.topic,
      required this.story,
      required this.format,
      required this.clickCount,
      required this.imaageSrc,
      required this.storyInHtml,
      required this.time,
      required this.linkYt,
      this.programType});

  static Article fromJson(Map<String, dynamic> json) => Article(
        linkYt: json['Link youtube (jika perlu)'] ?? 'null',
        time: json['Tanggal'] ?? 'no date',
        imageUrl: json['Gambar'] ?? 'image not found',
        title: json['Judul'] ?? 'title not found',
        tags: json['Tags'] ?? 'tags not found',
        topic: json['Topik edukasi'] ?? 'topic not found',
        story: json['Tulis naskahmu'] ?? 'story not found',
        format: json['Format'] ?? 'format not found',
        author: json['Penulis'] ?? 'anonymous',
        email: json['Email'] ?? 'anon@mail.com',
        imaageSrc: json['Sumber gambar'] ?? 'sumber: google',
        storyInHtml: json['Naskah dalam HTML'] ?? '404 not found',
        clickCount: 0,
        programType: json['Program kerja'] ?? 'program not found',
      );
}
