import 'package:final_project/Pets%20Adoption%20App/detailedpage.dart';
import 'package:flutter/material.dart';

class Sepratedpage extends StatefulWidget {
  const Sepratedpage({super.key});

  @override
  State<Sepratedpage> createState() => _SepratedpageState();
}

class _SepratedpageState extends State<Sepratedpage> {
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
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Detailpage(
                              id: 'detailscreen',
                            )));
              },
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.400,
                    height: size.height * 0.250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(''),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                              backgroundColor: Colors.white),
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: Colors.pink.withRed(9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.400,
                    height: size.height * 0.160,
                    decoration: BoxDecoration(
                      color: Colors.grey.withRed(9),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          15,
                        ),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 9),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.place,
                                ),
                              ),
                              Text('Loction'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
