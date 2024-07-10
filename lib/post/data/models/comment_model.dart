class CommentModel {
  final int commentId;
  final int postId;
  final String name;
  final String email;
  final String body;

  CommentModel({
    required this.commentId,
    required this.postId,
    required this.name,
    required this.email,
    required this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      commentId: json['id'],
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
