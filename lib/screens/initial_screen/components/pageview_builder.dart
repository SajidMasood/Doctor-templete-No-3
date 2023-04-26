import 'package:flutter/material.dart';

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;

  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(top: 50),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .6,
            margin: const EdgeInsets.only(top: 30),
            child: Center(child: Image.asset(imgurl)),
          ),
        ],
      ),

    );
  }
}
