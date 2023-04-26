import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../utils/app_colors.dart';
import '../../utils/my_button.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focuseDay = DateTime.now();
  DateTime? _currentDay; //= DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                // display table calendar here...
                const SizedBox(height: 15),
                _tableCalendar(),
                const SizedBox(height: 15),
                //___________________ Select Consulatant Time _____
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Center(
                    child: Text(
                      'Select Consultation Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          ////___________________ Text Appointment ________
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      'Weekend is not available, please select another date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          // when selected, update current index and set time selected to true
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index
                                ? AppColors.themeColor
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9} :00 ${index + 9 > 11 ? "PM" : "AM"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.5,
                  ),
                ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
              child: MyButton(
                disable: _timeSelected && _dateSelected ? false : true,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Successfull added your event"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  //Navigator.pushNamed(context, '/successBooking');
                },
                title: 'Make Appointment',
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.themeColor,
      title: const Text('Make an Appointment'),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: const Icon(Icons.arrow_back),
      ),
      actions: [
        PopupMenuButton(
          onSelected: (value) {
            // you logic
            // Navigator.pushNamed(context, value.toString());
            print('____________________ $value ____________________');
          },
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: '/home',
                child: Text('Home'),
              ),
              // 2nd
              const PopupMenuItem(
                value: '/about',
                child: Text('About'),
              ),

              // 3rd
              const PopupMenuItem(
                value: '/profile',
                child: Text('Profile'),
              ),
            ];
          },
        )
      ],
    );
  }

  Widget _tableCalendar() {
    return TableCalendar(
      focusedDay: _focuseDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2023, 12, 31),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: const CalendarStyle(
        todayDecoration: BoxDecoration(
          color: AppColors.themeColor,
          shape: BoxShape.circle,
        ),
        //new
        weekendTextStyle: TextStyle(color: Colors.red),
        // selectedDecoration: BoxDecoration(
        //   color: AppColors.primarygreen,
        //   shape: BoxShape.rectangle,
        // ),
        // new end
      ),
      // start new
      startingDayOfWeek: StartingDayOfWeek.monday,
      daysOfWeekStyle: const DaysOfWeekStyle(
        weekendStyle: TextStyle(color: Colors.red),
      ),

      // end
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_currentDay, selectedDay)) {
          setState(() {
            _currentDay = selectedDay;
            _focuseDay = focusedDay;
            _dateSelected = true;
            if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
              _isWeekend = true;
              _timeSelected = false;
              _currentIndex = null;
            } else {
              _isWeekend = false;
            }
          });
        }
      },
      selectedDayPredicate: (day) {
        return isSameDay(_currentDay, day);
      },
    );
  }
}
