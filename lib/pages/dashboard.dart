import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tech_nest/pages/home.dart';
import 'package:tech_nest/providers/bottomNavProvider.dart';
import 'package:tech_nest/styles.dart';

class DashBoardNav extends StatelessWidget {
  const DashBoardNav({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomProviderRead = context.read<BottomNavProvider>();
    var bottomProviderWatch = context.watch<BottomNavProvider>();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        enableFeedback: true,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: greyColor.withOpacity(0.6),
        selectedItemColor: primaryColor,
        currentIndex: bottomProviderWatch.bottomNavIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.devices_other), label: "Device"),
          BottomNavigationBarItem(icon: Icon(Icons.mic_none), label: "Voice"),
          BottomNavigationBarItem(
              icon: Icon(Icons.route_outlined), label: "Routine"),
          BottomNavigationBarItem(
              icon: Icon(Icons.stacked_bar_chart_outlined), label: "Stats"),
        ],
        onTap: (value) => bottomProviderRead.changeBottomNavIndex(value),
      ),
      body: Center(
        child: Consumer<BottomNavProvider>(
          builder: (context, index, child) {
            if (index.bottomNavIndex == 0) {
              return const HomeScreen();
            } else {
              return const Text("Device Page");
            }
          },
        ),
      ),
    );
  }
}

