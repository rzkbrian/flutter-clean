import 'package:DemoFlutter/presentation/utils/KeyManager.dart';
import 'package:DemoFlutter/presentation/utils/Utils.dart';
import 'package:DemoFlutter/presentation/views/feed/FeedScreen.dart';
import 'package:DemoFlutter/presentation/views/home/bloc/HomeBloc.dart';
import 'package:DemoFlutter/presentation/views/profile/ProfileScreen.dart';
import 'package:DemoFlutter/presentation/views/users/UserScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomeScreen> {
  HomeBloc _bloc;
  int indexTap = 0;

  void onTapTapped(int index) {
    if (indexTap == index) return;
    setState(() {
      indexTap = index;
    });
  }

  @override
  void initState() {
    _bloc = HomeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetsChildren = [
      ProfileScreen(key: KeyManager.screenProfile),
      FeedScreen(key: KeyManager.screenFeed),
      UserScreen(key: KeyManager.screenFriends)
    ];

    return Scaffold(
      body: BlocProvider<HomeBloc>(
        builder: (context) => _bloc,
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            debugPrint("Current State- Listener: $state");
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              debugPrint("Current State- Builder: $state");
              if (state is StartedState) {
                _bloc.add(CheckUserInDatabase());
              }
              return widgetsChildren[indexTap];
            },
          ),
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: ThemeColor.primaryColor, primaryColor: Colors.white),
        child: BottomNavigationBar(
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.idBadge), title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidComments), title: Text("")),
            BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userFriends), title: Text("")),
          ],
        ),
      ),
    );
  }
}
