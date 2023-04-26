import 'package:card_swiper/card_swiper.dart';
import 'package:doctor_template_no_3/screens/top_services/top_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/app_colors.dart';
import '../bottom_nav/components/drawer.dart';
import 'components/categories_box.dart';
import 'components/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      //_______ appbar
      appBar: _appBar(),
      drawer: const MyDrawer(),

      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          //color: Colors.amberAccent,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // text catagory...
                Container(
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // category boxes.....
                categoriesBox(),
                const SizedBox(height: 20),

                // swaping cart
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: size.height * 0.25,
                          child: Swiper(
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return SaleWidget();
                            },
                            autoplay: true,
                            pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.white,
                                activeColor: Colors.red,
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Top Services",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                //gridview
                BuildGridView(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView categoriesBox() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 5),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CategoryBox(
            title: "Cough",
            icon: FontAwesomeIcons.headSideCough,
            color: Colors.red,
          ),
          CategoryBox(
            title: "Snuffle",
            icon: FontAwesomeIcons.heartPulse,
            color: Colors.blue,
          ),
          CategoryBox(
            title: "Fiver",
            icon: FontAwesomeIcons.lungs,
            color: Colors.purple,
          ),
          CategoryBox(
            title: "Temperature",
            icon: FontAwesomeIcons.temperatureHigh,
            color: Colors.green,
          ),
          CategoryBox(
            title: "Cold",
            icon: FontAwesomeIcons.personPregnant,
            color: Colors.cyan,
          ),
          CategoryBox(
            title: "Dental",
            icon: FontAwesomeIcons.teeth,
            color: Colors.pinkAccent,
          ),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Dr J. Anti_Aging Clinic',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: AppColors.themeColor,
      //backgroundColor: Colors.transparent,
      //elevation: 0,
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
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.more_vert_sharp, color: Colors.white),
              onPressed: () {
                debugPrint("click here____________");
                Scaffold.of(context).openEndDrawer();
              },
            );
          },
        )
      ],
    );
  }
}

class BuildGridView extends StatefulWidget {
  const BuildGridView({super.key});

  @override
  State<BuildGridView> createState() => _BuildGridViewState();
}

class _BuildGridViewState extends State<BuildGridView> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "Aesthetics",
      "image": "image1.png",
    },
    {
      "title": "Anti-Aging",
      "image": "image2.png",
    },
    {
      "title": "Hair Restoration",
      "image": "image3.png",
    },
    {
      "title": "Men's Wellness",
      "image": "image4.png",
    },
    {
      "title": "Women's Wellness",
      "image": "image5.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: gridMap.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        mainAxisExtent: 230,
      ),
      itemBuilder: (_, index) {
        return InkWell(
          onTap: () {
            debugPrint('top services...');

            // method no 1 to pass argument
            //   Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => TopServices(detailData: gridMap[index]),
            //   ),
            // );

            // second method to pass parameter in Named
            Navigator.of(context).pushNamed(
              '/top_services',
              arguments: {
                'index': gridMap[index]
              }, 
            );
          },
          child: Container(
            //color: Colors.redAccent.shade100,
            decoration: BoxDecoration(
              //color: Color(0xff4367b1).withOpacity(0.5),
              color: Colors.white70,
              // gradient: const LinearGradient(
              //     colors: [
              //       Color(0xFF7A60A5),
              //       Color(0xFF82C3DF),
              //     ],
              //     begin: FractionalOffset(0.0, 0.0),
              //     end: FractionalOffset(1.0, 0.0),
              //     stops: [0.0, 1.0],
              //     tileMode: TileMode.clamp),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Container(
                  //color: Colors.amberAccent,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      //width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                      'assets/images/' + gridMap.elementAt(index)['image'],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    gridMap.elementAt(index)['title'],
                    style: Theme.of(context).textTheme.subtitle1!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                    // style: TextStyle(
                    //   fontSize: 18,
                    //   //color: Colors.white,
                    //   fontWeight: FontWeight.bold,
                    // ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
