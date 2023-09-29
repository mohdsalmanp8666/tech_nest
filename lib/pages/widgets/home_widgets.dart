import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:tech_nest/providers/homeProvider.dart';

import '../../styles.dart';

// ! Current Status Widget/s

// * Current Status Bar Main
class CurrentStatusBar extends StatelessWidget {
  const CurrentStatusBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(8)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // * Temperature
          StatusBarElement(
            heading: "Temperature",
            icon: Icons.thermostat_outlined,
            text: "28.8 \u2103",
          ),
          // * Humidity
          StatusBarElement(
            heading: "Humidity",
            icon: Icons.water_drop_outlined,
            text: "80%",
          ),
          // * Energy Used
          StatusBarElement(
            heading: "Energy Used",
            icon: Icons.electric_bolt_outlined,
            text: "250KWH",
          ),
        ],
      ),
    );
  }
}

// * Status Bar Single Element
class StatusBarElement extends StatelessWidget {
  final String heading;
  final IconData icon;
  final String text;
  const StatusBarElement(
      {super.key,
      required this.heading,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          heading,
          style: headLine(h5, FontWeight.normal, Colors.white),
        ),
        Row(
          children: [
            Icon(icon, size: 30, color: Colors.white.withOpacity(0.8)),
            Text(
              text,
              style: headLine(
                  body, FontWeight.normal, Colors.white.withOpacity(0.8)),
            )
          ],
        )
      ],
    );
  }
}

// ! Quick Actions Widget/s

// * Main Quick Actions Row
class QuickActionSection extends StatelessWidget {
  const QuickActionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            "Quick Actions",
            style: headLine(h5, FontWeight.w500, greyColor),
          ),
        ),
        Container(
          height: 110,
          // color: errorColor,
          padding: const EdgeInsets.fromLTRB(15, 7, 15, 7),
          child: Consumer<HomeProvider>(
              builder: (context, quickActionProvider, child) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                //  context.watch<HomeProvider>().quickActions.length,
                itemBuilder: (context, index) {
                  var data = context.watch<HomeProvider>().quickActions;
                  return QuickActionTile(
                    index: index,
                    icon: IconData(data[index].taskIcon,
                        fontFamily: 'MaterialIcons'),
                    heading: data[index].taskName,
                    subText1: data[index].scheduledTime,
                    subText2: "${data[index].devices} Devices",
                    enabled: data[index].enabled,
                  );
                });
          }),
        ),
      ],
    );
  }
}

// * Single Action Tile Layout
class QuickActionTile extends StatelessWidget {
  final IconData icon;
  final String heading;
  final String subText1;
  final String subText2;
  final bool enabled;
  final int index;
  const QuickActionTile({
    super.key,
    required this.icon,
    required this.heading,
    required this.subText1,
    required this.subText2,
    required this.enabled,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // TODO: Changing the enable disable feature with respect to API
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            enabled == true
                ? "Turning off... $heading Routine"
                : "Turning on... $heading Routine",
          ),
        ));
        await Future.delayed(const Duration(milliseconds: 200)).then((value) {
          context.read<HomeProvider>().changingActionState(index, enabled);
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.only(top: 05, left: 15, right: 15),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon.codePoint == 0xf03c3
                    ? Container()
                    : Icon(
                        icon,
                        color: enabled == false
                            ? Colors.white.withOpacity(0.5)
                            : Colors.white,
                        size: 30,
                      ),
                const SizedBox(width: 10),
                Text(
                  heading,
                  style: headLine(
                      body,
                      FontWeight.normal,
                      enabled == false
                          ? Colors.white.withOpacity(0.5)
                          : Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              subText1,
              style: headLine(
                  body,
                  FontWeight.normal,
                  enabled == false
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              subText2,
              style: headLine(
                  body,
                  FontWeight.normal,
                  enabled == false
                      ? Colors.white.withOpacity(0.5)
                      : Colors.white),
            ),
            // const SizedBox(height: 10),
            // Text("$enabled"),
          ],
        ),
      ),
    );
  }
}

// ! Active Devices Widget/s

// * Active Devices Main Section
class ActiveDevicesSection extends StatelessWidget {
  const ActiveDevicesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // * Active Devices Text
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(left: 20, bottom: 5),
          child: Text(
            "Active Devices",
            style: headLine(h5, FontWeight.w500, greyColor),
          ),
        ),
        // * Active Devices Row
        Container(
          height: 175,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Consumer<HomeProvider>(
              builder: (context, activeDevicesProvider, child) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 1,
                itemBuilder: (context, index) {
                  var data = context.watch<HomeProvider>().quickActions;
                  return Container(
                    width: 150,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: secondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // * For Icon and Radio Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.air,
                              size: 35,
                            ),
                            // TODO: Have to design custom radio button
                            Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ],
                        ),
                        // * For Device name and Room name
                        Container(
                          height: 70,
                          width: double.infinity,
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "A C",
                                style: headLine(h4, FontWeight.w400, greyColor),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Living Room",
                                style: headLine(body, FontWeight.normal,
                                    greyColor.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                  //  QuickActionTile(
                  //   index: index,
                  //   icon: IconData(data[index].taskIcon,
                  //       fontFamily: 'MaterialIcons'),
                  //   heading: data[index].taskName,
                  //   subText1: data[index].scheduledTime,
                  //   subText2: "${data[index].devices} Devices",
                  //   enabled: data[index].enabled,
                  // );
                });
          }),
        ),
      ],
    );
  }
}
