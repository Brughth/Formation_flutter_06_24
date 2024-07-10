import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/post/data/models/comment_model.dart';
import 'package:formation_flutter_join24/post/data/models/post_model.dart';
import 'package:formation_flutter_join24/post/data/repositories/post_repository.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({
    super.key,
    required this.post,
    this.showAppBar = true,
  });
  final PostModel post;
  final bool showAppBar;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  late PostRepository repository;
  late Future<List<CommentModel>> futureComments;

  @override
  void initState() {
    repository = PostRepository();
    futureComments = repository.loadComments(postId: widget.post.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.post.title),
            )
          : null,
      body: FutureBuilder<List<CommentModel>>(
        future: futureComments,
        builder:
            (BuildContext context, AsyncSnapshot<List<CommentModel>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
            case ConnectionState.waiting:
              return const Center(
                child: CupertinoActivityIndicator(
                  radius: 50,
                ),
              );
            case ConnectionState.none:
              return Center(
                child: Text("${snapshot.error}"),
              );
            case ConnectionState.done:
              var comments = snapshot.data;
              if (comments?.isEmpty ?? true) {
                return const Center(
                  child: Text("Aucun post pour le moment"),
                );
              }
              return ListView.separated(
                itemCount: comments!.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  var comment = comments[index];
                  return ListTile(
                    title: Text(comment.name),
                    subtitle: Text(comment.body),
                  );
                },
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
