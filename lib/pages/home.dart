import 'package:flutter/material.dart';
import 'package:tech_nest/pages/widgets/home_widgets.dart';

import '../styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // * Custom App bar
            Container(
              height: 70,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Good Morning, TechNest",
                    style: headLine(h4, FontWeight.normal, greyColor),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GestureDetector(
                      onTap: () {
                        print("Profile Avatar Clicked");
                      },
                      child: CircleAvatar(
                        backgroundColor: primaryColor,
                        radius: 50,
                        child: Text(
                          "T",
                          style: headLine(h4, FontWeight.normal, Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //  * Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 35),
                  child: Column(
                    children: [
                      // * Current Status
                      const CurrentStatusBar(),
                      // * Quick Actions
                      const QuickActionSection(),
                      // * Active Devices
                      // TODO: Changing Active Devices section to Pinned Devices
                      const ActiveDevicesSection(),
                      // * Rooms
                      Container(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        color: greyColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



