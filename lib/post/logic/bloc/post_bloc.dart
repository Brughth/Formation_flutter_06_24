import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:formation_flutter_join24/post/data/repositories/post_repository.dart';
import 'package:meta/meta.dart';

import '../../data/models/post_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<LoadPostEvent>((event, emit) async {
      try {
        emit(PostLoading());

        var posts = await PostRepository().getPosts();

        emit(PostSuccess(posts: posts));
      } catch (e) {
        emit(PostFailure(message: extractErrorMessage(e)));
      }
    });
  }
}

String extractErrorMessage(dynamic err) {
  try {
    if (err is DioException) {
      if (err.error is SocketException) {
        return "Check your internet connexion";
      }
    }

    return "$err";
  } catch (e) {
    return "$err";
  }
}
