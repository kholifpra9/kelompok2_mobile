import 'package:flutter/material.dart';
import 'package:projek_wisata/posts/post_1.dart';
import 'package:projek_wisata/posts/post_2.dart';
import 'package:projek_wisata/posts/post_3.dart';
import 'package:projek_wisata/widgets/button_nav_bar.dart';

class ShortsScreen extends StatelessWidget {
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ButtonNavBar(selectedMenu: MenuState.short),
      body: PageView(
        controller: _controller,
        scrollDirection: Axis.vertical,
        children: [
          Post1(),
          Post2(),
          Post3(),
        ],
      ),
    );
  }
}
