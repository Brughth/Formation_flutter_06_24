part of 'comment_list_cubit.dart';

@immutable
sealed class CommentListState {}

final class CommentListInitial extends CommentListState {}

final class CommentListLoading extends CommentListState {}

final class CommentListFailure extends CommentListState {
  final String message;

  CommentListFailure({required this.message});
}

final class CommentListSuccess extends CommentListState {
  final List<CommentModel> comments;

  CommentListSuccess({required this.comments});
}
