import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  IconData icon;
  Color? color;
  String title;

  CategoryBox({
    super.key,
    required this.title,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("You click here...on category list");
        Navigator.of(context).pushNamed(
          '/symptoms',
          arguments: title,
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.only(
          top: 20,
          bottom: 20,
          left: 30,
          right: 30,
        ),

        decoration: BoxDecoration(
          color: Colors.white,
          // gradient: const LinearGradient(
          //     colors: [
          //       Color(0xFF7A60A5),
          //       Color(0xFF82C3DF),
          //     ],
          //     begin: FractionalOffset(0.0, 0.0),
          //     end: FractionalOffset(1.0, 0.0),
          //     stops: [0.0, 1.0],
          //     tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),

        // child
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1!.merge(TextStyle(
                    color: color,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
