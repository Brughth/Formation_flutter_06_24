import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/post/logic/bloc/post_bloc.dart';

class PostScreenWithBloc extends StatefulWidget {
  const PostScreenWithBloc({super.key});

  @override
  State<PostScreenWithBloc> createState() => _PostScreenWithBlocState();
}

class _PostScreenWithBlocState extends State<PostScreenWithBloc> {
  late PostBloc postBloc;

  @override
  void initState() {
    postBloc = PostBloc()..add(LoadPostEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Screen With Bloc"),
      ),
      body: BlocBuilder<PostBloc, PostState>(
        bloc: postBloc,
        builder: (context, state) {
          if (state is PostFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      postBloc.add(LoadPostEvent());
                    },
                    child: const Text("Reload"),
                  ),
                  Text(
                    state.message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.red,
                        ),
                  ),
                ],
              ),
            );
          }

          if (state is PostLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 50,
              ),
            );
          }

          if (state is PostSuccess) {
            if (state.posts.isEmpty) {
              return const Center(child: Text("No Post Yet"));
            }

            return ListView.separated(
              itemCount: state.posts.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                var post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            );
          }

          return Container();
        },
      ),
    );
  }
}
