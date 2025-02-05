import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helppage extends StatefulWidget {
  const Helppage({super.key});

  @override
  State<Helppage> createState() => _HelppageState();
}

class _HelppageState extends State<Helppage> {
  // Function to launch WhatsApp
  void openWhatsApp(String phoneNumber, String message) async {
    String url = "https://wa.me/$phoneNumber?text=${Uri.encodeFull(message)}";
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print("Cannot launch WhatsApp");
    }
  }

  // Function to make a call
  void makeCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Cannot launch call");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withRed(9),
        title: Text('Help?'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withRed(9),
              ),
              onPressed: () {
                makeCall("7306715207");
              },
              icon: Icon(Icons.call, color: Colors.black),
              label: Text(
                'Call',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.withRed(9),
            ),
            onPressed: () {
              openWhatsApp("7306715207", "Hello! I need help.");
            },
            icon: Icon(Icons.perm_phone_msg_rounded, color: Colors.black),
            label: Text(
              'WhatsApp',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
