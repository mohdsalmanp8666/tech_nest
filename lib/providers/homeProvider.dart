import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  List<QuickActionsModel> quickActions = [
    QuickActionsModel(
      taskIcon: 0xf0575,
      taskName: "Wake Up",
      scheduledTime: "6.00 AM",
      devices: 5,
      enabled: true,
    ),
    QuickActionsModel(
      taskIcon: 0xef9f,
      taskName: "Sleep",
      scheduledTime: "11.00 PM",
      devices: 5,
      enabled: false,
    ),
    QuickActionsModel(
      taskIcon: 0xef56,
      taskName: "Clean",
      scheduledTime: "11.00 AM",
      devices: 4,
      enabled: false,
    ),
    QuickActionsModel(
      taskIcon: 0xf03c3,
      taskName: "Clean",
      scheduledTime: "11.00 AM",
      devices: 4,
      enabled: false,
    ),
  ];

  changingActionState(i, bool state) {
    quickActions[i].enabled = !state;
    notifyListeners();
  }
}

class QuickActionsModel {
  int taskIcon;
  String taskName;
  String scheduledTime;
  int devices;
  bool enabled;
  QuickActionsModel({
    this.taskIcon = 0xf03c3,
    required this.taskName,
    required this.scheduledTime,
    required this.devices,
    required this.enabled,
  });
}
