import 'package:flutter/material.dart';

class Circlepage extends StatefulWidget {
  const Circlepage({super.key});

  @override
  State<Circlepage> createState() => _CirclepageState();
}

class _CirclepageState extends State<Circlepage> {
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
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
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
            Container(
              width: size.width * 0.90,
              height: size.height * 0.33,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withRed(9),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name        :',
                          style: style,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'Address     :',
                          style: style,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'Pincode     :',
                          style: style,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'Email        :',
                          style: style,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'Phone       :',
                          style: style,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chris',
                          style: styl,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'ppppp',
                          style: styl,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          '65439',
                          style: styl,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          'leogahjd@gmail.com',
                          style: styl,
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Text(
                          ' 9876543210',
                          style: styl,
                        ),
                      ],
                    ),
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
    );
  }
}
