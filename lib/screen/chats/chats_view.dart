import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/bloc/feed/feed_bloc.dart';
import 'package:fluttergram/ui_shared/images.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';
import 'package:fluttergram/widgets/bottom_navbar.dart';
import 'package:fluttergram/widgets/input/input.dart';
import 'package:fluttergram/widgets/post.dart';
import 'package:fluttergram/widgets/state_message.dart';
import 'package:fluttergram/widgets/userstate_message.dart';

class ChatsScreen extends StatefulWidget {
  static String route = "/chats";

  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<ChatsScreen> {
  TextEditingController nameController = TextEditingController();
  FeedBloc feedBloc;
  dynamic posts;
  bool typing = true;
  @override
  void initState() {
    feedBloc = BlocProvider.of<FeedBloc>(context);
    feedBloc.add(Load());
    setState(() {
      posts = feedBloc.state.posts;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: Key('home_view'),
      backgroundColor: Color(0xFFF5F6F9),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.message),
      body: ScrollConfiguration(
        behavior: NeverGrowthScroll(),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InputSearch(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                height: 120.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    //prueba(),
                    UserStateMessage("assets/icons/user_state.svg", "Antonio"),
                    UserStateMessage(
                        "assets/icons/user_state_2.svg", "Alfredo"),
                    UserStateMessage("assets/icons/user_state_3.svg", "Juan"),
                    UserStateMessage("assets/icons/user_state_4.svg", "Pedro"),
                    UserStateMessage("assets/icons/user_state_5.svg", "Camilo"),
                    UserStateMessage("assets/icons/user_state.svg", "Mario"),
                  ],
                ),
              ),
              Column(
                children: [
                  MessageUser("assets/icons/user_state.svg", "Antonio Andres",
                      "Feb 13"),
                  MessageUser("assets/icons/user_state_2.svg",
                      "Alfredo de jesus", "Marz 23"),
                  MessageUser(
                      "assets/icons/user_state_3.svg", "Juan camilo", "Abr 24"),
                  MessageUser("assets/icons/user_state_4.svg", "Pedro andres",
                      "Jul 03"),
                  MessageUser("assets/icons/user_state_5.svg",
                      "Camilo de la cruz", "Dic 31")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget InputSearch() {
  return Container(
    alignment: Alignment.centerLeft,
    width: getProportionateScreenWidth(808),
    padding: EdgeInsets.fromLTRB(
        getProportionateScreenHeight(5),
        getProportionateScreenHeight(35),
        getProportionateScreenHeight(5),
        getProportionateScreenHeight(15)),
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(2),
        border: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
            borderSide: BorderSide(color: Colors.red)),
        labelText: "Search",
        prefixIcon: Icon(Icons.search),
        //icon: Icon(Icons.search),
      ),
    ),
  );
}
