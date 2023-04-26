import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../bottom_nav/components/drawer.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({super.key});

  @override
  State<PromotionScreen> createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: AppColors.themeColor,
        centerTitle: true,
        title: Text(
          'Promotions',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: CarouselSlider(
            items: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    //const SizedBox(height: 20),
                    Container(
                      //color: Colors.amberAccent,
                      child: Image.asset(
                        'assets/images/image1.png',
                        height: MediaQuery.of(context).size.height / 2.5,
                        //width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Text(
                      "Stay hydrated by drinking throughout the day.",
                      style: TextStyle(
                          //color: Color.fromARGB(255, 124, 20, 20),
                          color: AppColors.gradientEnd,
                          fontWeight: FontWeight.bold,
                          fontSize: 23.0),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Text(
                        "\"Need a doctor\" is a phrase commonly used to express a desire or urgent requirement for medical attention or assistance. It implies that someone is experiencing physical or mental distress and requires the expertise and intervention of a qualified medical professional. It can be a serious matter and may indicate a medical emergency or a long-term health issue that needs attention. Seeking medical help when needed is essential for maintaining good health and preventing potential complications.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          height: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ),
      ),
    );
  }
}
