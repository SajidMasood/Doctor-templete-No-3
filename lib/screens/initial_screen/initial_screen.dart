import 'package:flutter/material.dart';

import '../../model/allinonboardscreen.dart';
import '../../utils/app_colors.dart';
import 'components/pageview_builder.dart';
import 'components/path_painter.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int currentIndex = 0;
  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
      "assets/images/tour_1.png",
      "There are many variations of passages. There are many variations",
      "Prepard by exparts",
    ),
    AllinOnboardModel(
      "assets/images/tour_2.png",
      "There are many variations of passages. There are many variations",
      "Delivery to your home",
    ),
    AllinOnboardModel(
      "assets/images/tour_3.png",
      "There are many variations of passages. There are many variations",
      "Enjoy with everyone",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: pathPainter(),
              ),
            ),
            PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
              itemCount: allinonboardlist.length,
              itemBuilder: (context, index) {
                return PageBuilderWidget(
                    title: allinonboardlist[index].titlestr,
                    description: allinonboardlist[index].description,
                    imgurl: allinonboardlist[index].imgStr);
              },
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  allinonboardlist.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/bottom');
                },
                child: Container(
                  height: 80,
                  width: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0, 1],
                      colors: [AppColors.gradientStart, AppColors.gradientEnd],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(90),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
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

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: AppColors.kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index
            ? AppColors.primarygreen
            : Colors.amberAccent, //Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
