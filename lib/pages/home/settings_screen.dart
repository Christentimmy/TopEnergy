import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/retrieve_controller.dart';
import 'package:topenergy/controller/token_controller.dart';
import 'package:topenergy/controller/transaction_controller.dart';
import 'package:topenergy/onboarding/onboarding.dart';
import 'package:topenergy/pages/home/alt_profile_screen.dart';
import 'package:topenergy/pages/home/feedbacks.dart';
import 'package:topenergy/pages/home/security_settings/security_screen.dart';
import 'package:topenergy/widget/custom_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  final _retrieveController = Get.find<RetrieveController>();
  final _transController = Get.find<TransactionController>();
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
            children: <Widget>[
              const SizedBox(height: 10), // Add some spacing at the top
              buildListTile('Profile', Icons.person, () {
                Get.to(() => const AltProfileScreen());
              }),
              buildListTile('Security Settings', Icons.security, () {
                Get.to(() => const SecurityScreen());
              }),
              buildSwitchListTile(
                  'Notifications', Icons.notifications, _notificationsEnabled,
                  (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              }),
              buildListTile('Feedbacks', Icons.chat_bubble_rounded, () {
                Get.to(() => const FeedbackPage());
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
              buildListTile(
                'Delete Account',
                Icons.delete_forever_rounded,
                () {
                  // Implement navigation to Delete Account screen
                },
                textColor: Colors.red,
              ),
              buildListTile(
                'Logout',
                Icons.logout_rounded,
                () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Center(
                          child: Text(
                            "Log Out?",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        actions: [
                          CustomButton(
                            ontap: () async {
                              await TokenStorage().deleteToken();
                              _retrieveController.userDetails.value = null;
                              _transController.transactionHistory.clear();
                              Get.offAll(() => const OnboardingScreen());
                            },
                            child: const Text(
                              "Log out",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomButton(
                            ontap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Cancel",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                textColor: Colors.red,
              ),
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
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: Icon(
          icon,
          color: textColor,
        ),
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
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
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
