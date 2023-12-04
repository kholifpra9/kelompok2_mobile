import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:projek_wisata/constants.dart';
import 'package:projek_wisata/screens/Profile_Screen.dart';
import 'package:projek_wisata/screens/dashboard_screen.dart';
import 'package:projek_wisata/screens/eksplore_screen.dart';
import 'package:projek_wisata/screens/short_screen.dart';

enum MenuState { home, eksplore, short, profile }

class ButtonNavBar extends StatelessWidget {
  const ButtonNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_rounded,
                  size: 32.0,
                  color: MenuState.home == selectedMenu
                      ? primaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardScreen())),
              ),
              IconButton(
                icon: Icon(
                  Icons.assistant_navigation,
                  size: 32.0,
                  color: MenuState.eksplore == selectedMenu
                      ? primaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EkspolerScreen())),
              ),
              IconButton(
                icon: Icon(
                  Icons.video_collection,
                  size: 32.0,
                  color: MenuState.short == selectedMenu
                      ? primaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShortsScreen()));
                },
              ),
              IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    size: 32.0,
                    color: MenuState.profile == selectedMenu
                        ? primaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  }),
            ],
          )),
    );
  }
}
