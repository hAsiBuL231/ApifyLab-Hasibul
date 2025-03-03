import 'package:flutter/material.dart';

import 'comment_model.dart';
import 'comment_widget.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mockComments.length,
              itemBuilder: (context, index) {
                return CommentWidget(comment: mockComments[index]);
              },
            ),
          ),
          _buildCommentInput(),
        ],
      ),
    );
  }

  Widget _buildCommentInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            // Replace with user profile image
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: 'Write a comment...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Add comment logic here
              String newComment = _commentController.text;
              if (newComment.isNotEmpty) {
                setState(() {
                  mockComments.add(Comment(
                    author: 'You', // Replace with current user's name
                    content: newComment,
                    timestamp: DateTime.now(),
                  ));
                  _commentController.clear();
                });
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}



List<Comment> mockComments = [
  Comment(
    author: 'John Doe',
    content: 'This is a great post!',
    timestamp: DateTime.now().subtract(const Duration(days: 2)),
    likes: 5,
    replies: [
      Comment(
        author: 'Jane Smith',
        content: 'I agree!',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        likes: 2,
      ),
      Comment(
        author: 'Peter Jones',
        content: 'Awesome!',
        timestamp: DateTime.now(),
        likes: 1,
      ),
    ],
  ),
  Comment(
    author: 'Alice Brown',
    content: 'Interesting perspective.',
    timestamp: DateTime.now().subtract(const Duration(hours: 12)),
    likes: 10,
  ),
];
