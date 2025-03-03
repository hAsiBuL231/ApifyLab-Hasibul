import 'package:apifylab_hasib/utils/functions.dart';
import 'package:flutter/material.dart';

import '../../bloc/create_post/create_post_bloc.dart';

Widget buildPostInput() {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(1)),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(4, 10, 4, 0),
                child: Icon(Icons.person, size: 40, color: Colors.grey),
              ),
            ),
            // CircleAvatar(
            //   backgroundColor: Colors.grey[300], // Placeholder avatar
            // ),
            const SizedBox(width: 10),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Write Something here...',
                    hintStyle: TextStyle(color: Colors.grey),
                    //border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    border: InputBorder.none),
              ),
            ),
            const SizedBox(width: 10),
            Card(
                shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(1)),
                color: Colors.indigo[900],
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                  child: Text('Post', style: TextStyle(fontSize: 12, color: Colors.white)),
                )),
          ],
        ),
      ),
    ),
  );
}
