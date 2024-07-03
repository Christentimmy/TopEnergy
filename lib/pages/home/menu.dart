import 'package:flutter/material.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/pages/home/feedbacks.dart';
import 'package:topenergy/pages/home/profile.dart';
import 'package:topenergy/pages/home/security_settings/security_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: const Text(
          'Menu',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20), // Add some spacing at the top
              buildListTile('Profile', Icons.person, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              }),
              buildListTile('Security Settings', Icons.security, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecurityScreen()));
              }),
              buildSwitchListTile(
                  'Notifications', Icons.notifications, _notificationsEnabled,
                  (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              }),
              buildListTile('Feedbacks', Icons.chat_bubble_rounded, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FeedbackPage()));
              }),
              buildListTile('FAQs', Icons.security_update_warning, () {
                // Implement navigation to FAQs screen
              }),
              buildListTile('Privacy Policy', Icons.policy_rounded, () {
                // Implement navigation to Privacy Policy screen
              }),
              buildListTile('Terms & Conditions', Icons.security_rounded, () {
                // Implement navigation to Terms & Conditions screen
              }),

              buildListTile('Contact', Icons.call_rounded, () {
                // Implement navigation to Contact screen
              }),
              buildListTile('Delete Account', Icons.delete_forever_rounded, () {
                // Implement navigation to Delete Account screen
              }, textColor: Colors.red),
              buildListTile('Logout', Icons.logout_rounded, () {
                // Implement logout functionality
              }, textColor: Colors.red),
              const SizedBox(height: 20), // Add some spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(String title, IconData icon, Function() onTap,
      {Color textColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        leading: Icon(icon, color: textColor),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: textColor),
        onTap: onTap,
      ),
    );
  }

  Widget buildSwitchListTile(
      String title, IconData icon, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        leading: Icon(icon, color: Colors.black),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppsColor.primaryColor,
        ),
      ),
    );
  }
}
