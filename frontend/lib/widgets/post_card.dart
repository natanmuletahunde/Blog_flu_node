class Post {
  final int? id;
  final String? title;
  final String? content;
  final String? name;
  final String? description;
  final String? imageUrl;

  Post({this.id, this.title, this.content, this.name, this.description, this.imageUrl});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}