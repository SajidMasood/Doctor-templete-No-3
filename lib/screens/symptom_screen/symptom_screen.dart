import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SymptomScreen extends StatelessWidget {
  const SymptomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> drMap = [
      {
        "title": "Dr. Naila Mehsud",
        "image": "image1.png",
      },
      {
        "title": "Dr. Fadia Noor",
        "image": "image2.png",
      },
      {
        "title": "Dr. Sajid Abdali",
        "image": "image3.png",
      },
      {
        "title": "Dr. Muhammad Taha",
        "image": "image4.png",
      },
    ];
    final arguments = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: _appBar(arguments, context),
      body: _body(context, arguments, drMap),
      bottomNavigationBar: Container(
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
      ),
    );
  }

  SafeArea _body(BuildContext context, String? arguments,
      List<Map<String, dynamic>> drMap) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            // 1st
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                //color: AppColors.cyanColor,
                image: DecorationImage(
                  image: AssetImage('assets/images/image4.png'),
                ),
              ),
            ),
            // 2nd
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    arguments.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'A cough is a reflex action to clear your airways of mucus and irritants such as dust or smoke. It is rarely a sign of anything serious. Most coughs clear up within 3 weeks and dont require any treatment. A dry cough means its tickly and doesnt produce any phlegm (thick mucus).',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 10),

                  // Reviews
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: AssetImage(
                                        "assets/images/${drMap.elementAt(index)['image']}"),
                                  ),
                                  title: Text(
                                    //"Dr.Doctor Name",
                                    "${drMap.elementAt(index)['title']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: const Text("1 day ago"),
                                  // rating.........
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // row child no 1 star icon
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      // row child no 2 rating 4.9
                                      const Text(
                                        "4.9",
                                        style: TextStyle(
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // column child no 2 ............
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    "Many thanks to ${drMap.elementAt(index)['title']}. He is a great and professional doctor",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  // Reviews end
                  const SizedBox(height: 10),
                  const Text(
                    "Location",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: Color(0xFFF0EEFA),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(String? arguments, BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.themeColor,
      centerTitle: true,
      title: Text(arguments ?? "did not get any data"),
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
