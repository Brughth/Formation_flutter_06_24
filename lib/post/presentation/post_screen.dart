import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:formation_flutter_join24/post/data/repositories/post_repository.dart';
import 'package:formation_flutter_join24/post/presentation/comment_screen.dart';

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
                    onTap: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => CommentScreen(post: post),
                      //   ),
                      // );
                      showModalBottomSheet(
                        context: context,
                        elevation: 1,
                        isScrollControlled: true,
                        barrierColor: Colors.black.withOpacity(.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        builder: (context) {
                          return Container(
                            height: MediaQuery.of(context).size.height * .8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                  ),
                                  child: Center(
                                    child: Container(
                                      width: 100,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CommentScreen(
                                    post: post,
                                    showAppBar: false,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
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
