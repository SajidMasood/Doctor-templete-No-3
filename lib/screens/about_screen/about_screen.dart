import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../bottom_nav/components/drawer.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.themeColor,
      //
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.themeColor,
        centerTitle: true,
        title: const Text(
          'About Us',
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
      ),
      drawer: const MyDrawer(),

      //
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 65,
                            backgroundImage:
                                AssetImage("assets/images/tour_2.png"),
                            backgroundColor: Colors.white,
                          ),

                          const SizedBox(height: 15),
                          //_________________ Dr name_________________
                          const Text(
                            "Dr. Doctor Name",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 5),

                          //_________________Dr. Profession_________________
                          const Text(
                            "Therapist",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          //_________________ Degree | Qualification________
                          SizedBox(
                            //width: Config.widthSize * 0.75,
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: const Text(
                              'MBBS (International Medical University, Malaysia), MRCP (Royal Collage of Physicians, United Kingdom)',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 15,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 25),
                          //_________________ Hospital Name ________________
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: const Text(
                              'Sarawak General Hospital',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20, left: 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    //_________________Dr Indo Card ________________________
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, left: 0, right: 15),
                      child: DoctorInfo(),
                    ),
                    //_________________about Doctor text____________________
                    const SizedBox(height: 10),
                    const Text(
                      "About Doctor",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    //_________________ Doctor description_________________
                    const Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        'Dr. Richard Tan is an experience Dentist at Sarawak. He is graduated since 2008, and completed his training at Sungai Buloh General Hospital.',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                        softWrap: true,
                        textAlign: TextAlign.justify,
                      ),
                    ),

                    const SizedBox(height: 10),
                    //_________________Review|Rating|see All btn_________________
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
                    //_________________ ListView.Builder _______________
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
                                  // column child no 1 Dr card...................
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                    //_________________ Location_________________
                    const SizedBox(height: 10),

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
                    const SizedBox(height: 10),
                    //_________________ End Location _______________
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//_______________________________________________
class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        InfoCard(lable: 'Patients', value: '109'),
        SizedBox(width: 15),
        InfoCard(lable: 'Experiences', value: '10 Years'),
        SizedBox(width: 15),
        InfoCard(lable: 'Rating', value: '4.6'),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String lable;
  final String value;
  const InfoCard({super.key, required this.lable, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.themeColor,
        ),
        child: Column(
          children: [
            Text(
              lable,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
