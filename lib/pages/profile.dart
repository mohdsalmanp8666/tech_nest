import 'package:flutter/material.dart';
import 'package:tech_nest/pages/widgets/profile_widgets.dart';
import 'package:tech_nest/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // * Profile AppBar
            ProfileAppBar(),
            // * Profile Details
            ProfileSection(),
            // * Power and Devices Card
            PowerDevicesCards(),
            // * General Settings
            GeneralSettings(),
            // * 
          ],
        ),
      ),
    );
  }
}

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(defaultMargin),
      color: errorColor,
      height: 200,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // * General Settings Text
          Text(
            "General Settings",
            style: headLine(h4, FontWeight.w500, greyColor),
          ),
        ],
      ),
    );
  }
}
