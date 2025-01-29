import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Helppage extends StatefulWidget {
  const Helppage({super.key});

  @override
  State<Helppage> createState() => _HelppageState();
}

class _HelppageState extends State<Helppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withRed(9),
        title: Text(
          'Help?',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withRed(9)),
              onPressed: () async {
                final Uri url = Uri(
                  scheme: 'tel',
                  path: "7306715207",
                );
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  print('cannot lanuch this url');
                }
              },
              icon: Icon(
                Icons.call,
                color: Colors.black,
              ),
              label: Text(
                'Call',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.withRed(9)),
            onPressed: () {},
            icon: Icon(
              Icons.perm_phone_msg_rounded,
              color: Colors.black,
            ),
            label: Text(
              'whatsapp',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
