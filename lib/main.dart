import 'package:apifylab_hasib/bloc/create_post/create_post_bloc.dart';
import 'package:apifylab_hasib/repositories/comment_repository.dart';
import 'package:apifylab_hasib/repositories/create_post_repository.dart';
import 'package:apifylab_hasib/repositories/reaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/post/post_bloc.dart';
import 'repositories/auth_repository.dart';
import 'repositories/post_repository.dart';
import 'screens/login_screen/login_screen.dart';
import 'screens/post_screen/post_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => AuthRepository()),
        RepositoryProvider(create: (context) => PostRepository()),
        RepositoryProvider(create: (context) => CommentRepository()),
        RepositoryProvider(create: (context) => CreatePostRepository()),
        RepositoryProvider(create: (context) => ReactionRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthBloc()),
          BlocProvider(create: (context) => PostBloc()),
          BlocProvider(create: (context) => CreatePostBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          //home: PostScreen(),
        ),
      ),
    );
  }
}
