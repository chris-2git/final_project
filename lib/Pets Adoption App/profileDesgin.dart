import 'package:final_project/Pets%20Adoption%20App/adoptionDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/editpage.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/pagelogin.dart';
import 'package:final_project/Pets%20Adoption%20App/settingspage.dart';
import 'package:final_project/profileAPI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  static const routename = 'profile';
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  void initState() {
    Provider.of<ProfilePetsProvider>(context, listen: false)
        .profileData(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sty = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
    final styl = TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.normal);
    final style = TextStyle(
        color: const Color.fromARGB(255, 65, 64, 64),
        fontSize: 14,
        fontWeight: FontWeight.w200,
        fontStyle: FontStyle.normal);
    final style1 = TextStyle(color: Colors.white, fontSize: 15);
    final style2 = TextStyle(color: Colors.white, fontSize: 18);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile Card',
                    style: sty,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.qr_code_2_rounded,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/profile1.jpg'),
                  backgroundColor: Colors.green,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  width: size.width * 0.99,
                  height: size.height * 0.36,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withRed(9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Name :',
                              style: style2,
                            ),
                            Text(
                              'Adress :',
                              style: style2,
                            ),
                            Text(
                              'DOB :',
                              style: style2,
                            ),
                            Text(
                              'Email :',
                              style: style2,
                            ),
                            Text(
                              'Phone No :',
                              style: style2,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Consumer<ProfilePetsProvider>(
                                builder: (context, value, child) {
                              String username = "";
                              for (var i = 0; i < value.users.length; i++) {
                                username = value.users[i].firstname;
                                print(username + 'vvvvvvvvv');
                              }
                              return Text(
                                '$username',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                              );
                            }),
                            Consumer<ProfilePetsProvider>(
                              builder: (context, value, child) {
                                String useraddress = "";
                                for (var i = 0; i < value.users.length; i++) {
                                  useraddress = value.users[i].address;
                                  print(useraddress + 'address');
                                }
                                return Text(
                                  '$useraddress',
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 13),
                                );
                              },
                            ),
                            Consumer<ProfilePetsProvider>(
                                builder: (context, value, child) {
                              String userpin = "";
                              for (var i = 0; i < value.users.length; i++) {
                                userpin = value.users[i].dob;
                                print(userpin + 'pincode');
                              }
                              return Text(
                                '$userpin',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                              );
                            }),
                            Consumer<ProfilePetsProvider>(
                                builder: (context, value, child) {
                              String useremail = "";
                              for (var i = 0; i < value.users.length; i++) {
                                useremail = value.users[i].email;
                                print(useremail + 'vvvvvvvvv');
                              }
                              return Text(
                                '$useremail',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                              );
                            }),
                            Consumer<ProfilePetsProvider>(
                                builder: (context, value, child) {
                              String useremail = "";
                              for (var i = 0; i < value.users.length; i++) {
                                useremail = value.users[i].phone;
                                print(useremail + '');
                              }
                              return Text(
                                '$useremail',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16),
                              );
                            }),
                          ],
                        ),
                        IconButton(
                            style: IconButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Editpage(),
                                  ));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withRed(9)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Adoptdesign(),
                          ));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.sort,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: size.width * 0.01,
                        ),
                        Text(
                          'My Orders',
                          style: style1,
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withRed(9)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavouriteDesgin()));
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Fav Pets',
                      style: style1,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withRed(9)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settingspage(),
                          ));
                    },
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Settings',
                      style: style1,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withRed(9)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('Are you logouting'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Pagelogin(),
                                      ));
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.withRed(9),
                                ),
                                child: Text('yes'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.grey.withRed(9)),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
