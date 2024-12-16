import 'package:flutter/material.dart';

class Myorderpage extends StatefulWidget {
  const Myorderpage({super.key});

  @override
  State<Myorderpage> createState() => _MyorderpageState();
}

class _MyorderpageState extends State<Myorderpage> {
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
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 67,
        backgroundColor: Colors.grey.withRed(9),
        title: Text('My Order'),
      ),
      body: ListView.builder(
        itemCount: img.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: size.width * 0.40,
                  height: size.height * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                    image: DecorationImage(
                        image: AssetImage(
                          img[index],
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  width: size.width * 0.55,
                  height: size.height * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    color: Colors.grey.withRed(2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name:${nam[index]}',
                        ),
                        Text('Breed:'),
                        Text('Delivary date: 1/1/24')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
