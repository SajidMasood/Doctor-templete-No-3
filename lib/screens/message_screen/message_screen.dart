import 'package:doctor_template_no_3/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import '../bottom_nav/components/drawer.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        //leadingWidth: ,
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
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/images/anti-aging.png",
                height: 45,
                width: 45,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Dr Name",
                    style: TextStyle(color: Colors.white),
                  ),
                  const Text(
                    "Online",
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(right: 25),
          //   child: Icon(
          //     Icons.video_call,
          //     color: Colors.white,
          //   ),
          // ),
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
      body: ListView(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 80),
        children: [
          const ChatSample(),
          const ChatSample(),
          const ChatSample(),
          const ChatSample(),
        ],
      ),
      bottomSheet: const ChatBottomShet(),
    );
  }
}

class ChatBottomShet extends StatelessWidget {
  const ChatBottomShet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.transparent,
        // boxShadow: [
        //   BoxShadow(
        //     spreadRadius: 2,
        //     blurRadius: 10,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Padding(
          //   padding: EdgeInsets.only(left: 10),
          //   child: Icon(
          //     Icons.add,
          //     color: AppColors.themeColor,
          //     size: 30,
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(left: 5),
          //   child: Icon(
          //     Icons.emoji_emotions_outlined,
          //     color: AppColors.themeColor,
          //     size: 30,
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Container(
              alignment: Alignment.centerRight,
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Type here...",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.send,
              color: AppColors.themeColor,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class ChatSample extends StatelessWidget {
  const ChatSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE1E1E2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(3, 3),
                  ),
                ],
              ),
              child: const Text(
                "Hi, Doctor How are you ?",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 80),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, bottom: 25, right: 20),
                decoration: const BoxDecoration(
                  // color: Color(0xFF113953),
                  color: AppColors.themeColor,
                ),
                child: const Text(
                  "Hello, Patient, I am fine Thanks for asking what about you. I hope you will be fine",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
