import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_nest/providers/bottomNavProvider.dart';
import 'package:tech_nest/styles.dart';

// ! Profile AppBar Widget/s

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: appBarHeight,
      margin: const EdgeInsets.only(top: appBarMargin),
      padding: const EdgeInsets.only(
          left: appBarPaddingLeft, right: appBarPaddingRight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // * Back icon
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(35),
              ),
              child: const Icon(
                Icons.chevron_left_outlined,
                size: 30,
                color: primaryColor,
              ),
            ),
          ),
          const Icon(
            Icons.notifications_none_outlined,
            size: 30,
            color: greyColor,
          ),
        ],
      ),
    );
  }
}

// ! Profile Main Section Widget/s

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 250,
      // width: double.infinity,
      // color: errorColor,
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
          ),
          const SizedBox(height: 25),
          Text(
            "Tosin",
            style: headLine(h4, FontWeight.w500, greyColor),
          ),
          const SizedBox(height: 10),
          Text(
            "Abc@gmail.com",
            style: headLine(h4, FontWeight.w400, greyColor.withOpacity(0.6)),
          )
        ],
      ),
    );
  }
}

// ! Profile and Devices Cards Widget/s

// * Profile and devices cards main section
class PowerDevicesCards extends StatelessWidget {
  const PowerDevicesCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      // color: secondaryColor,
      width: double.infinity,
      margin: const EdgeInsets.all(defaultMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              // TODO: Have to implement this Navigation route
              onTap: () {},
              child: const PowerDevicesCard(
                icon: Icons.electric_bolt_outlined,
                cardHeading: "Power",
                cardText: "2500 KWh/Day",
              )),
          GestureDetector(
            onTap: () {
              context.read<BottomNavProvider>().changeBottomNavIndex(1);
              Navigator.pop(context);
            },
            child: const PowerDevicesCard(
              icon: Icons.smartphone_outlined,
              cardHeading: "Devices",
              cardText: "25 Devices",
            ),
          ),
        ],
      ),
    );
  }
}

// * Power And Devices Card

class PowerDevicesCard extends StatelessWidget {
  final IconData icon;
  final String cardHeading;
  final String cardText;

  const PowerDevicesCard({
    super.key,
    required this.icon,
    required this.cardHeading,
    required this.cardText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(50)),
            child: Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cardHeading,
                style: headLine(h4, FontWeight.w500, Colors.white),
              ),
              const SizedBox(height: 10),
              Text(
                cardText,
                style: headLine(
                    body, FontWeight.w500, Colors.white.withOpacity(0.6)),
              )
            ],
          )
        ],
      ),
    );
  }
}
