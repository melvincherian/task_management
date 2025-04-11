// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:task_management/features/presentation/widgets/appbar/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          NotificationCard(
              icon: '🔔',
              title: 'Reminder',
              message:
                  'Your interview with Sarah starts in 30 minutes. Get ready!'),
          NotificationCard(
              icon: '⏳',
              title: 'Upcoming Task',
              message:
                  'Don’t forget to complete Alex Interview before the deadline.'),
          NotificationCard(
              icon: '✅',
              title: 'Task Completed',
              message: 'Great job! You’ve checked off a task. Keep going!'),
          NotificationCard(
              icon: '⏳',
              title: 'Task Due',
              message:
                  'Your task "Submit Report" is due in 1 hour. Stay on track!'),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String icon;
  final String title;
  final String message;

  NotificationCard(
      {super.key,
      required this.icon,
      required this.title,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 213, 207, 207)),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(width: 12),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message,
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
