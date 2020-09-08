class News {
  final String title;
  final String description;
  final String author;
  final String url;
  final String category;
  final String image;

  News({
    this.title,
    this.description,
    this.author,
    this.url,
    this.category,
    this.image,
  });

  News.fromJson(Map jsonMap)
      : assert(jsonMap['title'] != null),
        assert(jsonMap['description'] != null),
        assert(jsonMap['author'] != null),
        assert(jsonMap['url'] != null),
        assert(jsonMap['category'] != null),
        assert(jsonMap['image'] != null),
        title = jsonMap['title'],
        description = jsonMap['description'],
        author = jsonMap['author'],
        url = jsonMap['url'],
        category = (jsonMap['category'] as List).first,
        image = jsonMap['image'];
}
