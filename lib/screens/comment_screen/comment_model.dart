class Comment {
  final String author;
  final String content;
  final DateTime timestamp;
  final int likes;
  final List<Comment> replies;

  Comment({
    required this.author,
    required this.content,
    required this.timestamp,
    this.likes = 0,
    this.replies = const [],
  });
}