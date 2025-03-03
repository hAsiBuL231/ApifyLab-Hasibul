import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/create_post/create_post_bloc.dart';
import '../../utils/functions.dart';
import '../post_screen/post_screen.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return BlocConsumer<CreatePostBloc, CreatePostState>(
      listener: (context, state) {
        if (state is CreatePostLoaded) {
          newPage(const PostScreen(), context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close', softWrap: true),
            ),
            title: const Text('Create Post', textAlign: TextAlign.center),
            actions: [
              TextButton(
                onPressed: () {
                  context.read<CreatePostBloc>().add(PostSubmitted(textController.text.trim()));
                },
                child: const Text('Create'),
              ),
            ],
            leadingWidth: 100,
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(26.0),
            child: Column(
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "What's on your mind?",
                        border: InputBorder.none,
                      ),
                      controller: textController,
                      maxLines: 5,
                      // onChanged: (text) {
                      //   context.read<CreatePostBloc>().add(PostTextChanged(text));
                      // },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                BlocBuilder<CreatePostBloc, CreatePostState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.chevron_left),
                        ),
                        for (int i = 0; i < 6; i++)
                          GestureDetector(
                            onTap: () {
                              context.read<CreatePostBloc>().add(ColorChanged(i));
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: _getColor(i),
                                border: state.selectedColorIndex == i ? Border.all(color: Colors.black, width: 2) : null,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                BlocConsumer<CreatePostBloc, CreatePostState>(
                  listener: (context, state) {
                    if (state.isSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Post created successfully!')),
                      );
                      Navigator.pop(context); // Go back after success
                    } else if (state.isFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Failed to create post.')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state.isSubmitting) {
                      return const CircularProgressIndicator();
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color _getColor(int index) {
    switch (index) {
      case 0:
        return Colors.white;
      case 1:
        return Colors.pink;
      case 2:
        return Colors.lightGreen;
      case 3:
        return Colors.yellow;
      case 4:
        return Colors.orange;
      case 5:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
