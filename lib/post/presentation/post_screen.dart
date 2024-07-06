import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/post/data/repositories/post_repository.dart';

import '../data/models/post_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late PostRepository repository;

  @override
  void initState() {
    repository = PostRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<PostModel>>(
        future: repository.getPosts(),
        builder:
            (BuildContext context, AsyncSnapshot<List<PostModel>> snapshot) {
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
              var posts = snapshot.data;
              if (posts?.isEmpty ?? true) {
                return const Center(
                  child: Text("Aucun post pour le moment"),
                );
              }
              return ListView.separated(
                itemCount: posts!.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  var post = posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
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
