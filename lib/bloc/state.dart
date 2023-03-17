//8:00

abstract class PostState {
  final posts;
  PostState(this.posts);
}

class InitState extends PostState {
  InitState(super.posts);
}

class PostLoadingState extends PostState {
  PostLoadingState(super.posts);
}

class PostSuccessState extends PostState {
  PostSuccessState({required posts}) : super(posts);

  
}
