class BlogModel {
  final String title;
  final String description;
  final String videoLink;
  final String? blogKey;

  BlogModel(
      {required this.description,
      required this.title,
      required this.videoLink,
      this.blogKey});

  factory BlogModel.fromFirebase(MapEntry<dynamic, dynamic> entry) {
    return BlogModel(
      blogKey: entry.key,
      description: entry.value['description'] ?? 'None',
      title: entry.value['title'] ?? 'Unknown',
      videoLink: entry.value['videoLink'] ?? "",
    );
  }

  static Map<String, dynamic> toFirebase(BlogModel blogModel) {
    return {
      'title': blogModel.title,
      'description': blogModel.description,
      'videoLink': blogModel.videoLink,
    };
  }
}
