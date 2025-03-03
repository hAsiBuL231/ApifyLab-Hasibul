import 'package:apifylab_hasib/screens/post_screen/post_screen.dart';
import 'package:apifylab_hasib/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/post_full_model.dart';
import '../../repositories/reaction_repository.dart';
import '../comment_screen/comment_screen.dart';

Widget BuildPostCard({
  required String userName,
  required String profilePic,
  required DateTime timeAgo,
  required String body,
  String? imageUrl,
  int? reactionCount,
  int? commentCount,
  required Post post,
  required context,
}) {
  return Card(
    margin: const EdgeInsets.all(8.0),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.grey[300], backgroundImage: NetworkImage(profilePic)),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(formatTimeDifference(timeAgo), style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(body),
          if (imageUrl != null) ...[
            const SizedBox(height: 10),
            //Image(image: NetworkImage(imageUrl)),
            Image.network(imageUrl, fit: BoxFit.fill),
          ],
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [const Icon(Icons.thumb_up), const Icon(Icons.favorite, color: Colors.red), Text("${reactionCount}")]),
              Row(children: [
                const Icon(Icons.comment),
                Text('$commentCount Comments'),
              ]),
            ],
          ),
          const Divider(),
          SizedBox(height: 6),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  final ReactionRepository reactionRepository = ReactionRepository();
                  await reactionRepository.createOrUpdateReaction(post.id ?? 0);
                  newPage(const PostScreen(), context);
                },
                child: Row(children: [
                  Icon(Icons.thumb_up),
                  SizedBox(width: 4),
                  const Text('Like'),
                ]),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  nextPage(CommentScreen(), context);
                },
                child: Row(children: [
                  Icon(Icons.comment_outlined),
                  SizedBox(width: 4),
                  const Text('Comment'),
                ]),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

String formatTimeDifference(DateTime dateTime) {
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds}s ago';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h ago';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}d ago';
  } else {
    final formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dateTime);
  }
}
