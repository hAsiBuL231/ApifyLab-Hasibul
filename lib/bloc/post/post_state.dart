part of 'post_bloc.dart';

class PostState {
  const PostState({this.posts});
  final List<Post>? posts;

  PostState copyWith({List<Post>? posts}) => PostState(posts: posts);

  List<Object?> get props => [posts];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded(this.posts);
}

class PostError extends PostState {
  final String message;
  PostError(this.message);
}
