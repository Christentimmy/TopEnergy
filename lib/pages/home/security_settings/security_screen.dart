import 'package:flutter/material.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/pages/auth/reset_password.dart';
import 'package:topenergy/pages/home/security_settings/reset_pin.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  bool _facIdEnabled = true;
  bool _transactionFaceIdEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Security Settings',
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
              buildListTile('Reset Pin', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResetPinScreen()),
                );
              }),
              buildListTile('Change Password', () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResetPassword()),
                );
              }),

              buildSwitchListTile('Activate FaceID for login', _facIdEnabled,
                  (value) {
                setState(() {
                  _facIdEnabled = value;
                });
              }),
              buildSwitchListTile('Authorize Transaction with FaceID',
                  _transactionFaceIdEnabled, (value) {
                setState(() {
                  _transactionFaceIdEnabled = value;
                });
              }),

              const SizedBox(height: 20), // Add some spacing at the bottom
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListTile(String title, Function() onTap,
      {Color textColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded, color: textColor),
        onTap: onTap,
      ),
    );
  }

  Widget buildSwitchListTile(
      String title, bool value, Function(bool) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
        trailing: Switch(
          value: value,
          onChanged: onChanged,
          activeColor: AppsColor.primaryColor,
        ),
      ),
    );
  }
}
