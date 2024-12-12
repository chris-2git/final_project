import 'package:flutter/material.dart';

class Sepratedpage extends StatefulWidget {
  const Sepratedpage({super.key});

  @override
  State<Sepratedpage> createState() => _SepratedpageState();
}

class _SepratedpageState extends State<Sepratedpage> {
  List<String> img = [
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
    final sty = TextStyle(
      color: Colors.black,
      fontSize: 18,
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dogs Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.withRed(9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: img.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: size.width * 0.400,
                  height: size.height * 0.250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(19),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        img[index],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.400,
                  height: size.height * 0.090,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name:',
                        style: sty,
                      ),
                      Text(
                        'Breed:',
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
