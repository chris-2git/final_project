import 'package:final_project/profileAPI.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Pets%20Adoption%20App/adoptionDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/categoryDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/page3home.dart';
import 'package:final_project/Pets%20Adoption%20App/profileDesgin.dart';
import 'package:final_project/Pets%20Adoption%20App/pagelogin.dart';
import 'package:provider/provider.dart';

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

  final List<String> iconame = [
    'Contacts',
    'Calls',
    'Saved Pets',
    'Invite friends',
    'Dark Glow',
    'Settings',
  ];

  final List<IconData> iconss = [
    Icons.contacts,
    Icons.call,
    Icons.save_alt_rounded,
    Icons.inventory_2_rounded,
    Icons.pause,
    Icons.settings,
  ];

  final List<Widget> _petsOptions = <Widget>[
    Homepage(),
    CategoryDesgin(),
    FavouriteDesgin(),
    Profilepage(),
  ];

  final TextStyle style1 = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

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

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 206, 204, 204),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 215, 210, 210),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey.withRed(9),
              ),
              accountName: Consumer<ProfilePetsProvider>(
                  builder: (context, value, child) {
                String username = "";
                for (var i = 0; i < value.users.length; i++) {
                  username = value.users[i].phone;
                  print(username + '');
                }
                return Text(
                  '$username',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                );
              }),
              accountEmail: Consumer<ProfilePetsProvider>(
                  builder: (context, value, child) {
                String useremail = "";
                for (var i = 0; i < value.users.length; i++) {
                  useremail = value.users[i].phone;
                  print(useremail + '');
                }
                return Text(
                  '$useremail',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                );
              }),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile1.jpg'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: iconame.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(iconss[index]),
                    title: Text(iconame[index], style: sty),
                    onTap: () {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(iconame[index]),
                            content: Text('You tapped on ${iconame[index]}.'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.withRed(9),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Are you logging out?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Pagelogin(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.withRed(9),
                            ),
                            child: Text('Yes'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey.withRed(9),
                            ),
                            child: Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(
                  Icons.logout_outlined,
                  color: Colors.white,
                ),
                label: Text(
                  'Logout',
                  style: style1,
                ),
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
                MaterialPageRoute(builder: (context) => Adoptdesign()),
              );
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
        elevation: 10,
      ),
    );
  }
}
