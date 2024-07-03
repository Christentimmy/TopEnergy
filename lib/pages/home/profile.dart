import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:topenergy/Resources/color.dart';
import 'package:topenergy/controller/retrieve_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

   final _retrieveController = Get.find<RetrieveController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'Update Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250, // Adjust this height as needed
                      margin: const EdgeInsets.only(bottom: 68),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage("assets/images/powava.png"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => TextFormField(
                 
                  decoration:  InputDecoration(
                    hintText: _retrieveController.userDetails.value?.name ?? "name",
                    enabledBorder: const  UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => TextFormField(
                 
                  decoration:  InputDecoration(
                    hintText:_retrieveController.userDetails.value?.email ?? "email",
                    enabledBorder:const  UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => TextFormField(
                  
                  decoration:  InputDecoration(
                    hintText: _retrieveController.userDetails.value?.phoneNumber ?? "Phone number",
                    enabledBorder: const UnderlineInputBorder(),
                    focusedBorder: const UnderlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppsColor.backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "Update",
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
