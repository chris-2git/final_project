import 'dart:io';

import 'package:final_project/Pets%20Adoption%20App/help.dart';
import 'package:flutter/material.dart';

class Privacypage extends StatefulWidget {
  const Privacypage({super.key});

  @override
  State<Privacypage> createState() => _PrivacypageState();
}

class _PrivacypageState extends State<Privacypage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Sty = TextStyle(
      fontSize: 17,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withRed(9),
        title: Text('Privacy & Policy'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Privacy Policy for [Fench & Find]',
                style: Sty,
              ),
              Text(
                'Introduction: Welcome to [App Name]. Your privacy is important to us. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you use our mobile application. Please read this policy carefully.',
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Information Collection:',
                style: Sty,
              ),
              Text(
                'Personal Data: We collect personal information that you provide to us, such as your name, email address, phone number, and address when you register on our app.',
              ),
              Text(
                  'Pet Information: We may collect data about pets you are interested in, such as adoption preferences and interaction history.'),
              Text(
                  'Usage Data: We automatically collect certain information about your device, including IP address, browser type, operating system, and app usage details.'),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Use of Information',
                style: Sty,
              ),
              Text(
                  'To Provide Services: We use your information to process adoption applications, facilitate communication between you and adoption coordinators, and improve our apps functionality.'),
              Text(
                  'To Communicate: We may use your information to send you updates, newsletters, and other information that may be of interest to you.'),
              Text(
                  'To Improve Services: We analyze usage data to understand how our app is used and to enhance the user experience.'),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Data Security',
                style: Sty,
              ),
              Text(
                  'We implement appropriate technical and organizational measures to protect your data from unauthorized access, disclosure, alteration, or destruction.'),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                "Childrens's, Privacy",
                style: Sty,
              ),
              Text(
                  'Our app is not intended for children under the age of 13. We do not knowingly collect personal information from children under 13 without parental consent.'),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Changes to this Policy',
                style: Sty,
              ),
              Text(
                  'We may update this Privacy Policy from time to time. We will notify you of any changes by posting the new policy on our app and updating the effective date.'),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                'Contact Us',
                style: Sty,
              ),
              Text(
                  'If you have any questions or concerns about this Privacy Policy, please contact us at'),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withRed(9),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Helppage(),
                      ));
                },
                icon: Icon(Icons.call),
                label: Text('Call'),
              ),
              Text(
                'Governing Law',
                style: Sty,
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              Text(
                  'This Privacy Policy is governed by the laws of your Jurisdiction')
            ],
          ),
        ),
      ),
    );
  }
}
