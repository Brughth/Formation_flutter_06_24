import 'package:bloc/bloc.dart';
import 'package:formation_flutter_join24/post/data/models/post_model.dart';
import 'package:formation_flutter_join24/post/data/repositories/post_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/comment_model.dart';

part 'comment_list_state.dart';

class CommentListCubit extends Cubit<CommentListState> {
  final PostModel post;
  CommentListCubit({
    required this.post,
  }) : super(CommentListInitial());

  loadComments() async {
    try {
      emit(CommentListLoading());
      var comments = await PostRepository().loadComments(
        postId: post.id,
      );
      emit(CommentListSuccess(comments: comments));
    } catch (e) {
      emit(CommentListFailure(message: e.toString()));
    }
  }
}
