class PostModel {
  final int id;
  final String date;
  final Guid guid;
  final String modified;
  final String slug;
  final String status;
  final String type;
  final String link;
  final Guid title;
  final Content content;
  final Content excerpt;
  final int featuredMedia;
  final String? featuredImage;

  PostModel({
    required this.id,
    required this.date,
    required this.guid,
    required this.modified,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.featuredMedia,
    this.featuredImage,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    String? imageUrl;
    try {
      imageUrl = json['_embedded']?['wp:featuredmedia']?[0]?['source_url'];
    } catch (_) {
      imageUrl = null;
    }

    return PostModel(
      id: json['id'],
      date: json['date'],
      guid: Guid.fromJson(json['guid']),
      modified: json['modified'],
      slug: json['slug'],
      status: json['status'],
      type: json['type'],
      link: json['link'],
      title: Guid.fromJson(json['title']),
      content: Content.fromJson(json['content']),
      excerpt: Content.fromJson(json['excerpt']),
      featuredMedia: json['featured_media'],
      featuredImage: imageUrl,
    );
  }
}

class Guid {
  final String rendered;

  Guid({required this.rendered});

  factory Guid.fromJson(Map<String, dynamic> json) {
    return Guid(rendered: json['rendered']);
  }
}

class Content {
  final String rendered;
  final bool isProtected;

  Content({required this.rendered, required this.isProtected});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      rendered: json['rendered'],
      isProtected: json['protected'],
    );
  }
}
