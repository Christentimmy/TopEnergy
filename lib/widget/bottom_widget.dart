import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/pages/home/buy_electricity.dart';
import 'package:topenergy/pages/home/homepage.dart';
import 'package:topenergy/pages/home/settings_screen.dart';
import 'package:topenergy/pages/home/transaction_screen.dart';

class BottomNaviagtionScreen extends StatefulWidget {
  const BottomNaviagtionScreen({super.key});

  @override
  State<BottomNaviagtionScreen> createState() => _BottomNaviagtionScreenState();
}

class _BottomNaviagtionScreenState extends State<BottomNaviagtionScreen> {
  List<Widget> appPages = [
    const HomePageScreen(),
    const ButElectricityScreen(),
    const TransactionPage(),
    const SettingsScreen(),
  ];

  int _selectedIndex = 0;


  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: GNav(
            selectedIndex: _selectedIndex,
            activeColor: Colors.black,
            onTabChange: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            tabBackgroundColor: AppsColor.primaryColor,
            color: Colors.white,
            backgroundColor: Colors.black,
            tabs: const [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.power, text: "Electricity"),
              GButton(icon: Icons.event, text: "Transaction"),
              GButton(icon: Icons.dashboard, text: "Menu"),
            ],
            padding: const EdgeInsets.all(10.0),
          ),
        ),
      ),
      body: appPages[_selectedIndex],
    );
  }
}
