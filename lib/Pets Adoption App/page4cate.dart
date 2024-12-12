import 'package:final_project/Pets%20Adoption%20App/sepratedpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Categorypage extends StatefulWidget {
  const Categorypage({super.key});

  @override
  State<Categorypage> createState() => _CategorypageState();
}

class _CategorypageState extends State<Categorypage> {
  List<String> img = [
    'assets/dogs6.jpg',
    'assets/cats9.jpg',
    'assets/fishes.jpg',
    'assets/birds.jpg',
    'assets/hens1.jpg',
    'assets/ducks.jpg',
    'assets/allpets.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final sty = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: img.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Sepratedpage(),
                        ));
                  },
                  child: Container(
                    width: size.width * 0.400,
                    height: size.height * 0.240,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          img[index],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: size.width * 400,
                    height: size.height * 0.080,
                    child: Text(
                      'aaaa',
                      style: sty,
                    ),
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
