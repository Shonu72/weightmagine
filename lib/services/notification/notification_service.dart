// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';

// class NotificationService extends GetxService {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> init() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> scheduleDailyNotification(TimeOfDay time, String message) async {
//     final now = DateTime.now();
//     final scheduleTime = DateTime(
//       now.year,
//       now.month,
//       now.day,
//       time.hour,
//       time.minute,
//     );

//     const AndroidNotificationDetails androidDetails =
//         AndroidNotificationDetails(
//       'daily_channel_id',
//       'Daily Notifications',
//       importance: Importance.high,
//     );

//     const NotificationDetails platformDetails =
//         NotificationDetails(android: androidDetails);

//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Reminder',
//       message,
//       scheduleTime,
//       platformDetails,
//       androidAllowWhileIdle: true,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }
// }
