import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formation_flutter_join24/post/data/models/post_model.dart';
import 'package:formation_flutter_join24/post/logic/cubit/comment_list_cubit.dart';

class CommentsScreenWIthCubit extends StatefulWidget {
  final PostModel post;
  const CommentsScreenWIthCubit({
    super.key,
    required this.post,
  });

  @override
  State<CommentsScreenWIthCubit> createState() =>
      _CommentsScreenWIthCubitState();
}

class _CommentsScreenWIthCubitState extends State<CommentsScreenWIthCubit> {
  late CommentListCubit commentListCubit;

  @override
  void initState() {
    commentListCubit = CommentListCubit(post: widget.post)..loadComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Screen With Bloc"),
      ),
      body: BlocBuilder<CommentListCubit, CommentListState>(
        bloc: commentListCubit,
        builder: (context, state) {
          if (state is CommentListFailure) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      commentListCubit.loadComments();
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

          if (state is CommentListLoading) {
            return const Center(
              child: CupertinoActivityIndicator(
                radius: 50,
              ),
            );
          }

          if (state is CommentListSuccess) {
            if (state.comments.isEmpty) {
              return const Center(child: Text("No comment Yet"));
            }

            return ListView.separated(
              itemCount: state.comments.length,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (context, index) {
                var comment = state.comments[index];
                return ListTile(
                  title: Text(comment.name),
                  subtitle: Text(comment.body),
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
