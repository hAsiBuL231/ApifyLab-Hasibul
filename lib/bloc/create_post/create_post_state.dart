part of 'create_post_bloc.dart';

class CreatePostState extends Equatable {
  final String postText;
  final int selectedColorIndex;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  const CreatePostState({
    this.postText = '',
    this.selectedColorIndex = 0,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isFailure = false,
  });

  CreatePostState copyWith({
    String? postText,
    int? selectedColorIndex,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    return CreatePostState(
      postText: postText ?? this.postText,
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  List<Object> get props => [
        postText,
        selectedColorIndex,
        isSubmitting,
        isSuccess,
        isFailure,
      ];
}

class CreatePostInitial extends CreatePostState {}

class CreatePostLoading extends CreatePostState {}

class CreatePostLoaded extends CreatePostState {}

class CreatePostError extends CreatePostState {
  final String message;
  CreatePostError(this.message);
}
