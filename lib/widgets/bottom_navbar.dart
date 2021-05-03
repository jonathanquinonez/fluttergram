import 'package:flutter/material.dart';
import 'package:fluttergram/screen/home/home_view.dart';
import 'package:fluttergram/screen/profile/profile_view.dart';
import 'package:fluttergram/ui_shared/images.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/screen/chats/chats_view.dart';

enum MenuState { home, favourite, message, profile }

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
    @required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  void onPressCreatePost(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight:Radius.circular(40),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: ImageFactory.svg(
                'assets/icons/home.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(32),
                color: MenuState.home == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Navigator.pushNamed(context, HomeScreen.route),
            ),
            IconButton(
              icon: ImageFactory.svg(
                'assets/icons/heart.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(32),
                color: MenuState.favourite == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {},
            ),
            InkWell(
              onTap: () => onPressCreatePost(context),
              child: SizedBox(
                height: getProportionateScreenHeight(48),
                width: getProportionateScreenWidth(48),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: ImageFactory.svg(
                'assets/icons/chat.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(32),
                color: MenuState.message == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () => Navigator.pushNamed(context, ChatsScreen.route),
            ),
            IconButton(
              icon: ImageFactory.svg(
                'assets/icons/user.svg',
                height: getProportionateScreenHeight(32),
                width: getProportionateScreenWidth(32),
                color: MenuState.profile == selectedMenu
                    ? primaryColor
                    : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.route),
            ),
          ],
        ),
      ),
    );
  }
}
