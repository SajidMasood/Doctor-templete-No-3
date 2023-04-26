import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../about_screen/about_screen.dart';
import '../home_screen/home_screen.dart';
import '../message_screen/message_screen.dart';
import '../notification_screen/notification_screen.dart';
import '../promotion_screen/promotion_screen.dart';
import '../schedule_screen/schedule_screen.dart';
import 'components/drawer.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  //______________Srt
  int _pageIndex = 0;
  final GlobalKey _bottomNavigationKey = GlobalKey();

  List pages = [
    MyRoute(
      iconData: Icons.home,
      page: const HomeScreen(),
    ),
    MyRoute(
      iconData: Icons.bookmark,
      page: PromotionScreen(),
    ),
    MyRoute(
      iconData: Icons.message,
      page: MessageScreen(),
    ),
    MyRoute(
      iconData: Icons.event_note_rounded,
      page: ScheduleScreen(),
    ),
    MyRoute(
      iconData: Icons.wash_rounded,
      page: AboutScreen(),
    ),
    MyRoute(
      iconData: Icons.notification_add,
      page: NotificationScreen(),
    ),
  ];
  //______________End
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,

      //_______ appbar
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     'Dr Name!',
      //     style: TextStyle(color: Colors.black),
      //   ),
      //   //backgroundColor: Color(0xff4367b1),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   leading: Builder(
      //     builder: (context) {
      //       return IconButton(
      //         //icon: Icon(Icons.settings),
      //         icon: const Icon(
      //           Icons.vertical_split,
      //           color: Colors.black,
      //         ),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //       );
      //     },
      //   ),
      //   actions: [
      //     Builder(
      //       builder: (context) {
      //         return IconButton(
      //           icon: Icon(Icons.more_vert_sharp, color: Colors.black),
      //           onPressed: () {
      //             Scaffold.of(context).openEndDrawer();
      //           },
      //         );
      //       },
      //     )
      //   ],
      // ),

      //________body____
      body: pages[_pageIndex].page,
      //________Drawar open___
      drawer: const MyDrawer(),

      //_______ BottomNavBar____
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: pages
            .map(
              (p) => Icon(
                p.iconData,
                size: 30,
                color: Colors.white,
              ),
            )
            .toList(),
        color: Color(0xff4367b1),
        //buttonBackgroundColor: Color(0xff4367b1),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 500),
        onTap: (index) {
          setState(
            () {
              _pageIndex = index;
            },
          );
        },
      ),
    );
  }
}

class MyRoute {
  final IconData iconData;
  final Widget page;

  MyRoute({
    required this.iconData,
    required this.page,
  });
}
