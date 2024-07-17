import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class Notify{
  static Future<bool>instantNotify()async{
    final AwesomeNotifications awesomeNotifications
    = AwesomeNotifications();
    return awesomeNotifications.createNotification(content: NotificationContent(id: 3,
        wakeUpScreen: true,
        title: "WARNING!!!!",

        body:"Alert detected by laser System",
        backgroundColor: Colors.red,
        channelKey: "instant_notifcations"),
    );
  }
  static Future<bool>instantNotify1()async{
    final AwesomeNotifications awesomeNotifications
    = AwesomeNotifications();
    return awesomeNotifications.createNotification(content: NotificationContent(id: 3,
        wakeUpScreen: true,
        title: "WARNING !!!!",
        body:"Alert Detected by Indoor Unit",
        backgroundColor: Colors.red,
        channelKey: "instant_notifcations"),
    );
  }
  static Future<bool>instantNotify2()async{
    final AwesomeNotifications awesomeNotifications
    = AwesomeNotifications();
    return awesomeNotifications.createNotification(content: NotificationContent(id: 3,
        wakeUpScreen: true,
        title: "WARNING !!!!",
        body:"Alert Detected by Outdoor Unit",
        backgroundColor: Colors.red,
        channelKey: "Outdoor_notifications"),
    );
  }
}