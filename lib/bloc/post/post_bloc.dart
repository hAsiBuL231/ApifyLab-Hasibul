import 'package:apifylab_hasib/repositories/post_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/post_full_model.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository = PostRepository();

  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<FetchPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await postRepository.fetchPosts();
        emit(PostLoaded(posts));
        emit(state);
      } catch (e) {
        emit(PostError(e.toString()));
      }
    });
  }
}
