import 'package:flutter/material.dart';

class Favouritepage extends StatefulWidget {
  const Favouritepage({super.key});

  @override
  State<Favouritepage> createState() => _FavouritepageState();
}

class _FavouritepageState extends State<Favouritepage> {
  List<String> img = [
    'assets/cats1.jpg',
    'assets/cats2.jpg',
    'assets/cats3.jpg',
    'assets/cats4.jpg',
    'assets/cats5.jpg',
    'assets/cats6.jpg',
    'assets/cats7.jpg',
    'assets/cats8.jpg',
    'assets/cats9.jpg',
    'assets/dogs1.jpg',
    'assets/dogs2.jpg',
    'assets/dogs3.jpg',
    'assets/dogs4.jpg',
    'assets/dogs5.jpg',
    'assets/dogs6.jpg',
    'assets/dogs7.jpg',
    'assets/dogs8.jpg',
    'assets/dogs9.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.6),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                width: size.width * 0.400,
                height: size.height * 0.250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  image: DecorationImage(
                      image: AssetImage(
                        img[index],
                      ),
                      fit: BoxFit.cover),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.400,
                height: size.height * 0.140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.grey.withRed(9),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name:'),
                      Text('Breed:'),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.place,
                              color: Colors.black,
                            ),
                          ),
                          Text('Loction')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
