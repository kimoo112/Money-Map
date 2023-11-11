import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  // Sample data. Replace with your actual notification data.
  final List<NotificationModel> notifications = [
    NotificationModel(
        message: 'Your transaction of \$500 was successful.',
        timestamp: '5 mins ago',
        icon: Icons.payment,
        color: Colors.green),
    NotificationModel(
        message: 'New offer! Get 10% cashback on next transaction.',
        timestamp: '1 hour ago',
        icon: Icons.local_offer,
        color: Colors.blue),
    NotificationModel(
        message: 'Your monthly statement is ready.',
        timestamp: 'Yesterday',
        icon: Icons.receipt_long,
        color: Colors.orange),
    NotificationModel(
        message: 'Profile updated successfully.',
        timestamp: '2 days ago',
        icon: Icons.account_circle,
        color: Colors.teal),
    NotificationModel(
        message: 'You earned 50 reward points!',
        timestamp: '3 days ago',
        icon: Icons.star,
        color: Colors.amber),
    NotificationModel(
        message: 'Your payment of \$150 is pending.',
        timestamp: '4 days ago',
        icon: Icons.error_outline,
        color: Colors.red),
    NotificationModel(
        message:
            'Welcome to our platform! Get started with your first transaction.',
        timestamp: '1 week ago',
        icon: Icons.thumb_up,
        color: Colors.purple),
    NotificationModel(
        message: 'Security alert! New login detected.',
        timestamp: '10 days ago',
        icon: Icons.security,
        color: Colors.redAccent),
    NotificationModel(
        message: 'Referral bonus! You earned \$25 for referring John.',
        timestamp: '11 days ago',
        icon: Icons.group,
        color: Colors.cyan),
    NotificationModel(
        message: 'Your password was updated successfully.',
        timestamp: '12 days ago',
        icon: Icons.lock_open,
        color: Colors.blueGrey),
  ];

  NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title:
      //        Text('Notifications'.toUpperCase(), style: TextStyle(fontSize: 18.sp,color: Theme.of(context).scaffoldBackgroundColor)),
      //   backgroundColor: Theme.of(context).primaryColor,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return _buildNotificationItem(notifications[index]);
          },
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: notification.color,
          child: Icon(notification.icon, color: Colors.white),
        ),
        title: Text(notification.message),
        subtitle: Text(notification.timestamp,
            style: const TextStyle(fontSize: 12.0)),
        onTap: () {
          // Handle the tap action: mark as read, navigate to details, etc.
        },
        trailing: IconButton(
          icon: const Icon(Icons.clear, color: Colors.red),
          onPressed: () {
            // Handle delete notification or mark as read
          },
        ),
      ),
    );
  }
}

class NotificationModel {
  final String message;
  final String timestamp;
  final IconData icon;
  final Color color;

  NotificationModel(
      {required this.message,
      required this.timestamp,
      required this.icon,
      required this.color});
}
