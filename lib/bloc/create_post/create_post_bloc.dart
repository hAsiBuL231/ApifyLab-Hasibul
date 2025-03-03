import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/create_post_repository.dart';

part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatePostRepository createPostRepository = CreatePostRepository();

  CreatePostBloc() : super(const CreatePostState()) {
    on<CreatePostEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<PostSubmitted>((event, emit) async {
      emit(CreatePostLoading());
      try {
        final post = await createPostRepository.createPost(event.text);
        emit(CreatePostLoaded());
        emit(state);
      } catch (e) {
        emit(CreatePostError(e.toString()));
      }
    });
  }
}
