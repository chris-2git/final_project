import 'package:final_project/Pets%20Adoption%20App/Privacy.dart';
import 'package:final_project/Pets%20Adoption%20App/help.dart';
import 'package:flutter/material.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({super.key});

  @override
  State<Settingspage> createState() => _SettingspageState();
}

class _SettingspageState extends State<Settingspage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 67,
        backgroundColor: Colors.grey.withRed(9),
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Privacypage(),
                  ));
            },
            child: lists(
              'Privacy & Policy',
              Icons.lock,
              Icons.arrow_right,
            ),
          ),
          lists(
            'Notification',
            Icons.notifications,
            Icons.arrow_right,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Helppage(),
                  ));
            },
            child: lists(
              'Help',
              Icons.help,
              Icons.arrow_right,
            ),
          ),
        ],
      ),
    );
  }

  Widget lists(String na, IconData ic, IconData ico) {
    return ListTile(
      title: Text(na),
      leading: Icon(ic),
      trailing: Icon(ico),
    );
  }
}
