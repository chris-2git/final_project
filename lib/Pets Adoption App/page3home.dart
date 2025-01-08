import 'package:final_project/Pets%20Adoption%20App/apiHome.dart';
import 'package:final_project/Pets%20Adoption%20App/apidesignHome.dart';
import 'package:final_project/Pets%20Adoption%20App/apiwidgetHome.dart';
import 'package:final_project/Pets%20Adoption%20App/detailedpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static const routename = "Petdetails";
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    Provider.of<PetsProvider>(context, listen: false)
        .allCategoriesData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<PetsProvider>(context);
    final size = MediaQuery.of(context).size;
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
                              '',
                            ),
                          ),
                          Text(
                            '',
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
              pet.loadingSpinner
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: Colors.green,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    )
                  : pet.pets.isEmpty
                      ? Text('Loading...')
                      : SizedBox(
                          height: size.height * 0.9,
                          child: GridView.builder(
                            itemCount: pet.pets.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 15,
                                    childAspectRatio: 0.7),
                            itemBuilder: (context, index) {
                              return PetWidget(
                                petid: pet.pets[index].petid,
                                name: pet.pets[index].name,
                                species: pet.pets[index].species,
                                breed: pet.pets[index].breed,
                                age: pet.pets[index].age,
                                sex: pet.pets[index].sex,
                                color: pet.pets[index].sex,
                                weight: pet.pets[index].weight,
                                dob: pet.pets[index].dob,
                                microchipid: pet.pets[index].microchipid,
                                aid: pet.pets[index].aid,
                                diet: pet.pets[index].diet,
                                behaviour: pet.pets[index].behaviour,
                                status: pet.pets[index].status,
                                notes: pet.pets[index].notes,
                                addeddate: pet.pets[index].addeddate,
                                photo: pet.pets[index].photo,
                              );
                            },
                          ),
                        ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Detailpage(),
              //       ),
              //     );
              //   },
              //   child: Container(
              //     height: size.height * 100,
              //     child: GridView.builder(
              //       itemCount: imge.length,
              //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //           crossAxisCount: 2,
              //           childAspectRatio: 0.7,
              //           mainAxisSpacing: 14,
              //           crossAxisSpacing: 10),
              //       itemBuilder: (context, index) {
              //         return Column(
              //           children: [
              //             Container(
              //               width: size.width * 0.7,
              //               height: size.height * 0.20,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.only(
              //                     topLeft: Radius.circular(17),
              //                     topRight: Radius.circular(17)),
              //                 image: DecorationImage(
              //                   image: AssetImage(
              //                     imge[index],
              //                   ),
              //                   scale: 6,
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.end,
              //                 crossAxisAlignment: CrossAxisAlignment.end,
              //                 children: [
              //                   IconButton(
              //                     style: IconButton.styleFrom(
              //                         backgroundColor: Colors.white),
              //                     onPressed: () {},
              //                     icon: Icon(
              //                       Icons.favorite_border_outlined,
              //                       color: Colors.pink.withRed(9),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //             Container(
              //               width: size.width * 0.7,
              //               height: size.height * 0.15,
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.only(
              //                     bottomLeft: Radius.circular(17),
              //                     bottomRight: Radius.circular(17)),
              //                 color: Colors.grey.withRed(9),
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.only(left: 9),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text('Name:'),
              //                     Text('Breed:'),
              //                     Row(
              //                       children: [
              //                         ElevatedButton.icon(
              //                           style: ElevatedButton.styleFrom(
              //                             backgroundColor:
              //                                 Colors.grey.withRed(9),
              //                           ),
              //                           onPressed: () {},
              //                           icon: Icon(
              //                             Icons.place,
              //                             color: Colors.black,
              //                           ),
              //                           label: Text(
              //                             'Loction',
              //                             style: style1,
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         );
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
