import 'dart:math';

import 'package:flutter/material.dart';

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  @override
  Widget build(BuildContext context) {
    final sty = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                      'assets/profile1.jpg',
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 85,
                    right: 30,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.grey.withRed(9),
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            editContainer(
              Icons.person,
              'Edit Name',
              Colors.black,
            ),
            editContainer(
              Icons.person,
              'Edit Last Name',
              Colors.black,
            ),
            editContainer(
              Icons.abc,
              'Edit Address',
              Colors.black,
            ),
            editContainer(
              Icons.pin,
              'Edit Pincode',
              Colors.black,
            ),
            editContainer(
              Icons.email,
              'Edit Email',
              Colors.black,
            ),
            editContainer(
              Icons.lock,
              'Edit Password',
              Colors.black,
            ),
            editContainer(
              Icons.phone,
              'Edit Number',
              Colors.black,
            ),
            SizedBox(height: size.height * 0.04),
            Container(
              width: size.width * 0.40,
              height: size.height * 0.080,
              decoration: BoxDecoration(
                color: Colors.grey.withRed(9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: sty,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget editContainer(IconData icon, String name, Color newcolor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.05),
          borderRadius: BorderRadius.circular(17),
          border: Border.all(
            color: Colors.grey.withRed(9),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                name,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
