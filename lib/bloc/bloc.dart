//9:20

import 'package:bloc_with_pagination/bloc/event.dart';
import 'package:bloc_with_pagination/bloc/state.dart';
import 'package:bloc_with_pagination/post_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  int page = 1;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  PostRepo repo;

  PostBloc(this.repo) : super(InitState(null)) {
    scrollController.addListener(() {
      add(LoadMoreEvent());
    });
    on<FetchPostsEvent>(
      (event, emit) async {
        emit(PostLoadingState(null));
        var posts = await repo.fetchPosts(page);
        emit(PostSuccessState(posts: posts));
      },
    );

    on<LoadMoreEvent>(
      (event, emit) async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          isLoadingMore = true;
          page++;
          var posts = await repo.fetchPosts(page);
          emit(PostSuccessState(posts: [...state.posts, ...posts]));
        }
      },
    );
  }
}
