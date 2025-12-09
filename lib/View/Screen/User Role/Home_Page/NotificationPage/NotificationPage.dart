import 'package:flutter/material.dart';
import 'NotificationCard.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Notifications",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            sectionTitle("Today"),
            NotificationCard(
              title: "Your service request has been sent.",
              subtitle: "Just now",
            ),
            NotificationCard(
              title: "Your booking request has approved.",
              subtitle: "30 min ago",
            ),
            NotificationCard(
              title: "Your service has been completed.",
              subtitle: "2 hours ago",
            ),

            const SizedBox(height: 20),

            sectionTitle("Yesterday"),
            NotificationCard(
              title: "Payment Successful",
              subtitle: "Dec 10, 2025",
            ),
            NotificationCard(
              title: "Booking Reminder",
              subtitle: "Dec 10, 2025",
            ),
            NotificationCard(
              title: "Your service has been completed.",
              subtitle: "Dec 10 ago",
            ),

            const SizedBox(height: 20),

            sectionTitle("This Week"),
            NotificationCard(
              title: "New Message",
              subtitle: "Dec 4, 2025",
            ),

          ],
        ),
      ),
    );
  }

  /// SECTION TITLE WIDGET
  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.black87,
        ),
      ),
    );
  }

}