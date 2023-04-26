import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../bottom_nav/components/drawer.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: AppColors.themeColor,
                    ),
                    title: Text(
                      "This Notification here...",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: AppColors.themeColor,
      centerTitle: true,
      title: Text(
        'Notification',
        style: TextStyle(color: Colors.white),
      ),
      leading: Builder(
        builder: (context) {
          return IconButton(
            //icon: Icon(Icons.settings),
            icon: const Icon(
              Icons.vertical_split,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
