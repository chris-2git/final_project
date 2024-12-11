import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    final st = TextStyle(
        color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500);
    final styl = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

    final sty = TextStyle(
        color: Colors.white70, fontSize: 26, fontWeight: FontWeight.bold);
    final style = TextStyle(
        decoration: TextDecoration.underline,
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500);
    final style1 = TextStyle(
        color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500);
    final style2 = TextStyle(
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold);
    final style3 = TextStyle(
      color: Colors.black,
      fontSize: 20,
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withRed(9),
        title: Text('Overview Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width * double.infinity,
              height: size.height * 0.350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/dogs.png'),
                ),
              ),
            ),
            Container(
              width: size.width * double.infinity,
              height: size.height * 0.600,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.grey.withRed(3),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(65, 65),
                  topRight: Radius.elliptical(65, 65),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pug Dog',
                            style: st,
                          ),
                          Text(
                            'Breed:',
                            style: styl,
                          ),
                          Text('rating bar'),
                        ],
                      ),
                      Text(
                        'Rs:',
                        style: sty,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: size.width * 0.20,
                          height: size.height * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(
                              19,
                            ),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Gender',
                                style: style2,
                              ),
                              Text(
                                'Male',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Container(
                          width: size.width * 0.20,
                          height: size.height * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(
                              19,
                            ),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Age',
                                style: style2,
                              ),
                              Text(
                                '4',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Container(
                          width: size.width * 0.20,
                          height: size.height * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(
                              19,
                            ),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Height',
                                style: style2,
                              ),
                              Text('4cm'),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Container(
                          width: size.width * 0.20,
                          height: size.height * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(
                              19,
                            ),
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(''),
                              Text('4'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description:',
                          style: style,
                        ),
                        Text(
                            'Dogs are wonderful creatures and have earned the title of "man for good reasons. They are domesticated mammals, closely related to wolves, and have been part of human society for thousands of years.Here are a few interesting points about dogs'),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border_outlined,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.black,
                                    backgroundColor: Colors.indigo),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.pets,
                                  size: 30,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'adopt',
                                  style: style1,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
