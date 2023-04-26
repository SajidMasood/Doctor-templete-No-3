import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(150),
          ),
          child: SizedBox(
            width: 250,
            child: Drawer(
              child: ListView(
                children: [
                  const Center(
                    child: UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        //color: Colors.blue,
                        color: Color(0xff4367b1),
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/anti-aging.png'),
                      ),
                      accountName: Text(
                        'Masood Tech',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          //color: Colors.grey[300],
                          color: Colors.white,
                        ),
                      ),
                      accountEmail: Text(
                        'final.waiter786@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    hoverColor: AppColors.themeColor,
                    title: const Text(
                      'Appointment',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app

                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.calendar_month_outlined,
                      size: 26.0,
                      color: AppColors.themeColor,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Color & Design',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.notifications,
                      size: 26.0,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Social Media',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.message,
                      size: 26.0,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    title: const Text(
                      'Login Options',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.touch_app,
                      size: 26.0,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(
                    color: Colors.black38,
                  ),
                  ListTile(
                    title: const Text(
                      'Close Menu',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    onTap: () {
                      // Update the state of the app
                      // ...
                      // Then close the drawer
                      Navigator.pop(context);
                    },
                    leading: const Icon(
                      Icons.close,
                      size: 26.0,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
