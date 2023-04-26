import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class TopServices extends StatefulWidget {
  const TopServices({
    super.key,
  });

  @override
  State<TopServices> createState() => _TopServicesState();
}

class _TopServicesState extends State<TopServices> {
// Declare a field that holds the Todo.
  @override
  Widget build(BuildContext context) {
    //final arguments = ModalRoute.of(context)!.settings.arguments;
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    //print(arguments['khan']);

    return Scaffold(
      //backgroundColor: AppColors.themeColor,
      appBar: _appBar(context),
      body: Body(context, arguments),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  _bottomNavBar() {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 130,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
          ),
        ],
      ),
      // Container child
      child: Column(
        children: [
          // Column Item no 1 consultant price ...................
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Row Item No 1......
              const Text(
                "Consultation Price",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              // Row Item No 2......
              const Text(
                "\$100",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          // Column item no 2 Book Appointment btn
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/bookingScreen');
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text(
                  "Book Appointment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SafeArea Body(BuildContext context, Map<dynamic, dynamic> arguments) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                //color: AppColors.themeColor,
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/${arguments['index']['image']}'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 15),
                  const Text(
                    "About Services",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Dr. Richard Tan is an experience Dentist at Sarawak. He is graduated since 2008, and completed his training at Sungai Buloh General Hospital.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    children: [
                      // row child no 1
                      const Text(
                        "Reviews",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 10),
                      // row child no 2...
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      // row child no 3.....
                      const Text(
                        "4.9",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      // row child no 4...
                      const SizedBox(width: 5),
                      const Text(
                        "(124)",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Color(0xFF7165D6),
                        ),
                      ),
                      // spacer align next widget to the end of row
                      const Spacer(),
                      // row child no  5...
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Color(0xFF7165D6),
                          ),
                        ),
                      ),
                    ],
                  ),

                  //
                  const SizedBox(height: 10),
                  const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  //
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.greenshede0,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.location_on,
                        color: Color(0xFF7165D6),
                        size: 30,
                      ),
                    ),
                    title: const Text(
                      "New York, Medical Center",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      "address line of the medical center,",
                    ),
                  ),
                  // _________________ End Location _______________
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.themeColor,
      title: const Text('Top Services'),
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
}
