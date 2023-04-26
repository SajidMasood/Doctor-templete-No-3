import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../bottom_nav/components/drawer.dart';
import 'components/cancel_schedule.dart';
import 'components/completed_schedule.dart';
import 'components/upcoming_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _buttonIndex = 0;
  final _scheduleWidgets = [
    // Upcoming Widget
    const UpcomingSchedule(),
    // Completed Widget
    const CompletedSchedule(),
    // Canceled Widget
    const CanceledSchedule(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        centerTitle: true,
        title: Text(
          'Appointment',
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),

      //body
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F6FA),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Row Item No 1. InkWEll
                      InkWell(
                        onTap: () {
                          setState(() {
                            _buttonIndex = 0;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 25),
                          decoration: BoxDecoration(
                            color: _buttonIndex == 0
                                ? AppColors.themeColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Upcoming",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _buttonIndex == 0
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                        ),
                      ),
                      // Row Item No 2. InkWEll
                      InkWell(
                        onTap: () {
                          setState(() {
                            _buttonIndex = 1;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 25),
                          decoration: BoxDecoration(
                            color: _buttonIndex == 1
                                ? AppColors.themeColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Completed",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _buttonIndex == 1
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                        ),
                      ),

                      // Row Item No 3. InkWEll
                      InkWell(
                        onTap: () {
                          setState(() {
                            _buttonIndex = 2;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 25),
                          decoration: BoxDecoration(
                            color: _buttonIndex == 2
                                ? AppColors.themeColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "Canceled",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _buttonIndex == 2
                                  ? Colors.white
                                  : Colors.black38,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //
                // Column Item No 3.
                const SizedBox(height: 30),
                _scheduleWidgets[_buttonIndex],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
