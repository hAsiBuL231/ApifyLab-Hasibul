import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'comment_model.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;
  final bool isReply;

  const CommentWidget({
    Key? key,
    required this.comment,
    this.isReply = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: isReply ? 20.0 : 0.0), // Indent replies
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const CircleAvatar(
              // Replace with user profile image
              child: Icon(Icons.person),
            ),
            title: Text(comment.author),
            subtitle: Text(comment.content),
            trailing: const Icon(Icons.more_horiz),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  DateFormat.yMMMd().format(comment.timestamp),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(width: 10),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.thumb_up_alt_outlined, size: 16),
                  label: Text('${comment.likes}'),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('Reply'),
                ),
              ],
            ),
          ),
          if (comment.replies.isNotEmpty)
            Column(
              children: comment.replies
                  .map((reply) => CommentWidget(comment: reply, isReply: true))
                  .toList(),
            ),
        ],
      ),
    );
  }
}