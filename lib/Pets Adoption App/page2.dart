import 'package:final_project/Pets%20Adoption%20App/page3home.dart';
import 'package:final_project/Pets%20Adoption%20App/page4cate.dart';
import 'package:final_project/Pets%20Adoption%20App/adoption.dart';
import 'package:final_project/Pets%20Adoption%20App/profile.dart';
import 'package:final_project/Pets%20Adoption%20App/favourtiepage.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  int _petsIndex = 0;
  void _petsTapped(int index) {
    setState(() {
      _petsIndex = index;
    });
  }

  List<String> iconame = [
    'Contacts',
    'Calls',
    'Saved Pets',
    'Invite friends',
    'Help ?',
    'Dark Glow',
    'settings'
  ];
  List<Icon> iconss = [
    Icon(Icons.contacts),
    Icon(Icons.call),
    Icon(Icons.save_alt_rounded),
    Icon(Icons.inventory_2_rounded),
    Icon(Icons.help_center_rounded),
    Icon(Icons.pause),
    Icon(Icons.settings)
  ];
  List<Widget> _petsOptions = <Widget>[
    Homepage(),
    Categorypage(),
    Favouritepage(),
    Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: Color.fromARGB(255, 55, 58, 57),
      fontSize: 23,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    );
    final sty = TextStyle(
      color: Color.fromARGB(255, 55, 58, 57),
      fontSize: 19,
      fontStyle: FontStyle.normal,
    );

    final size = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 204, 204),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 215, 210, 210),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                'Leo John Varghese',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              accountEmail: Text(
                'leojohn@gmail.com',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile1.jpg'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: iconame.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: iconss[index],
                      ),
                      Text(
                        iconame[index],
                        style: sty,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        backgroundColor: Colors.grey.withRed(9),
        title: Text('Fetch & Find', style: style),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Adoptionpage(),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 24,
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage('assets/allpets.jpg'),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: _petsOptions.elementAt(_petsIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Category',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _petsIndex,
          iconSize: 28,
          onTap: _petsTapped,
          elevation: 10),
    );
  }
}
