import 'package:apifylab_hasib/components/custom_text_field.dart';
import 'package:apifylab_hasib/components/typography.dart';
import 'package:apifylab_hasib/repositories/post_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/post/post_bloc.dart';
import '../../utils/functions.dart';
import '../create_post_screen/create_post_screen.dart';
import '../login_screen/login_screen.dart';
import '../logout_screen/logout_popup.dart';
import 'build_post_input.dart';
import 'build_post_card.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<PostBloc>().add(FetchPosts());
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() async {
      _selectedIndex = index;
      if (index == 1) {
        await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return const LogoutPopup();
          },
        );
        //context.read<AuthBloc>().add(LogoutRequested());
        //newPage(LoginScreen(), context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF105964),
        title: const Row(
          children: [
            Icon(Icons.menu, color: Colors.white), // Hamburger menu
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Python Developer Community', style: TextStyle(fontSize: 16, color: Colors.white)),
                Text('#General', style: TextStyle(fontSize: 8, color: Colors.white70)),
              ],
            ),
          ],
        ),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        listener: (context, state) {
          if (state is PostError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                GestureDetector(onTap: () => nextPage(const CreatePostScreen(), context), child: buildPostInput()),
                if (state is PostLoading) const Center(child: CircularProgressIndicator()),
                if (state is PostLoaded)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) {
                      return BuildPostCard(
                        userName: state.posts[index].name ?? '',
                        timeAgo: state.posts[index].publishDate ?? DateTime.now(),
                        body: state.posts[index].feedTxt ?? '',
                        imageUrl: state.posts[index].pic ?? '',
                        profilePic: state.posts[index].user?.profilePic ?? '',
                        commentCount: state.posts[index].commentCount ?? 0,
                        reactionCount: state.posts[index].likeCount ?? 0,
                        post: state.posts[index],
                        context: context,
                      );
                    },
                  ),
              ],
            ),
          );
          return Container();
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Community'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Logout'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
