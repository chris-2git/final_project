import 'package:final_project/Pets%20Adoption%20App/detailedpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> img = [
    'assets/dogs.png',
    'assets/cats.png',
    'assets/dogs.png',
    'assets/cats.png',
    'assets/dogs.png',
    'assets/cats.png',
    'assets/dogs.png',
    'assets/cats.png',
  ];
  List<String> na = [
    'Dogs',
    'Cats',
    'Birds',
    'Fishes',
    'Hens',
    'Ducks',
    'Rabbits',
    'Others',
  ];
  List<String> imge = [
    'assets/dogs1.jpg',
    'assets/cats1.jpg',
    'assets/dogs2.jpg',
    'assets/cats2.jpg',
    'assets/dogs3.jpg',
    'assets/cats3.jpg',
    'assets/dogs4.jpg',
    'assets/cats4.jpg',
    'assets/dogs5.jpg',
    'assets/cats5.jpg',
    'assets/dogs6.jpg',
    'assets/cats6.jpg',
    'assets/dogs7.jpg',
    'assets/cats7.jpg',
    'assets/dogs8.jpg',
    'assets/cats8.jpg',
    'assets/dogs9.jpg',
    'assets/cats9.jpg',
  ];
  List<String> nam = [
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
  ];
  List<String> name = [
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
    'Dogs',
    'Cats',
  ];
  @override
  Widget build(BuildContext context) {
    final sty = TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    );
    final styl = TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    );
    final style = TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
    );
    final st = TextStyle(
      color: Colors.black,
      fontSize: 17,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    );
    final style1 = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.withAlpha(9),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.black, fontSize: 19),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width * double.infinity,
                height: size.height * 0.27,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.99)),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withRed(9)),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 56, top: 10),
                          child: Text(
                            'Join Our Pets',
                            style: sty,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: Text(
                            'Community',
                            style: styl,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 9),
                          child: Text('(Creating our own pets world)'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 36, top: 7),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shadowColor: Colors.pink,
                              backgroundColor: Colors.blue.withBlue(9),
                            ),
                            onPressed: () {},
                            child: Text(
                              'Join Us',
                              style: style,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Image.asset(
                      'assets/pets.4.png',
                      height: size.height * 0.40,
                      width: size.width * 0.36,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Text(
                'Categories',
                style: st,
              ),
              Container(
                height: size.height * 0.15,
                child: ListView.builder(
                  itemCount: img.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.withRed(9),
                            radius: 34,
                            backgroundImage: AssetImage(
                              img[index],
                            ),
                          ),
                          Text(
                            na[index],
                            style: style1,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(
                'Recommended Once',
                style: st,
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detailpage(),
                      ));
                },
                child: Container(
                  height: size.height * 100,
                  child: GridView.builder(
                    itemCount: imge.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        mainAxisSpacing: 14,
                        crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            width: size.width * 0.7,
                            height: size.height * 0.20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(17),
                                  topRight: Radius.circular(17)),
                              image: DecorationImage(
                                image: AssetImage(
                                  imge[index],
                                ),
                                scale: 6,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: size.width * 0.7,
                            height: size.height * 0.15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(17),
                                  bottomRight: Radius.circular(17)),
                              color: Colors.grey.withRed(9),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 4),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Name:${nam[index]}',
                                      ),
                                      Text(
                                        'Breed:${name[index]}',
                                        style: style1,
                                      ),
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color.fromARGB(
                                                255, 247, 233, 233)),
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.person,
                                          color: Colors.green,
                                          size: 15,
                                        ),
                                        label: Column(
                                          children: [
                                            Text('Owner'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.03,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.save_alt,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
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
