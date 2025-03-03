part of 'create_post_bloc.dart';

abstract class CreatePostEvent extends Equatable {
  const CreatePostEvent();

  @override
  List<Object> get props => [];
}

class PostSubmitted extends CreatePostEvent {
  final String text;

  const PostSubmitted(this.text);

  @override
  List<Object> get props => [text];
}

class PostTextChanged extends CreatePostEvent {
  final String text;

  const PostTextChanged(this.text);

  @override
  List<Object> get props => [text];
}

class ColorChanged extends CreatePostEvent {
  final int colorIndex;

  const ColorChanged(this.colorIndex);

  @override
  List<Object> get props => [colorIndex];
}
