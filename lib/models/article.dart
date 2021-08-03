class Article {
  final String imageUrl;
  final String story;
  final String topic;
  final String tags;
  final String title;
  final String format;
  final String author;
  final String email;
  final int clickCount;
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
      this.programType});

  static Article fromJson(Map<String, dynamic> json) => Article(
        imageUrl: json['Gambar'] ?? 'image not found',
        title: json['Judul'] ?? 'title not found',
        tags: json['Tags'] ?? 'tags not found',
        topic: json['Topik edukasi'] ?? 'topic not found',
        story: json['Tulis naskahmu'] ?? 'story not found',
        format: json['Format'] ?? 'format not found',
        author: json['Penulis'] ?? 'anonymous',
        email: json['Email'] ?? 'anon@mail.com',
        clickCount: 0,
        programType: json['Program kerja'] ?? 'program not found',
      );
}
