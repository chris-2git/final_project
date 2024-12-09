import 'package:flutter/material.dart';

class Page3home extends StatefulWidget {
  const Page3home({super.key});

  @override
  State<Page3home> createState() => _Page3homeState();
}

class _Page3homeState extends State<Page3home> {
  List<String> img = [
    'assets/dogs.png',
    'assets/cats.png',
    'assets/dogs.png',
    'assets/cats.png',
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

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 239, 213, 239),
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
                  color: Color.fromRGBO(18, 11, 144, 1).withOpacity(0.4),
                ),
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
                                backgroundColor:
                                    const Color.fromARGB(255, 162, 0, 212)
                                        .withOpacity(0.8)),
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
                            radius: 34,
                            backgroundImage: AssetImage(
                              img[index],
                            ),
                          ),
                          Text(na[index])
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
              Container(
                height: size.height * 900,
                color: Colors.green,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
