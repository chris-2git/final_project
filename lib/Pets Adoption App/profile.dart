import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
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
    final style2 = TextStyle(color: Colors.black, fontSize: 18);
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
                            'Pincode :',
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
                          Text(
                            'Christy',
                            style: style2,
                          ),
                          Text(
                            'Panikalathu.....',
                            style: style2,
                          ),
                          Text(
                            '67894',
                            style: style2,
                          ),
                          Text(
                            'christyjos@gmail.com',
                            style: style2,
                          ),
                          Text(
                            '987656789',
                            style: style2,
                          ),
                        ],
                      ),
                      IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Adoption',
                      style: style1,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withRed(9)),
                    onPressed: () {},
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.translate_outlined,
                      color: Colors.white,
                    ),
                    label: Text(
                      'language',
                      style: style1,
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.withRed(9)),
                    onPressed: () {},
                    icon: Icon(
                      Icons.reviews,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Reviews',
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