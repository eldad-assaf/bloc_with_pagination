import 'package:bloc_with_pagination/bloc/bloc.dart';
import 'package:bloc_with_pagination/bloc/event.dart';
import 'package:bloc_with_pagination/post_repo.dart';
import 'package:bloc_with_pagination/post_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MaterialApp(home: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PostRepo>(
      create: (context) => PostRepo(),
      child: BlocProvider<PostBloc>(
        create: (context) => PostBloc(RepositoryProvider.of<PostRepo>(context))
          ..add(FetchPostsEvent()),
        child: const PostUi(), 
      ),
    );
  }
}
