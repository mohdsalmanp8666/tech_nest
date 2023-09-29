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
