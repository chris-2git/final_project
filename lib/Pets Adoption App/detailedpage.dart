import 'package:final_project/Pets%20Adoption%20App/adoptionAPI.dart';
import 'package:final_project/Pets%20Adoption%20App/adoptionDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/apiHome.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteApi.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteDesign.dart';
import 'package:final_project/profileAPI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detailpage extends StatefulWidget {
  static const routname = 'detailscreen';
  final String id;
  const Detailpage({
    super.key,
    required this.id,
  });

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    final adopt = Provider.of<AdoptProvider>(context);
    final pet = Provider.of<FavPetsProvider>(context);
    final user = Provider.of<ProfilePetsProvider>(context);
    final detaildata = Provider.of<PetsProvider>(context)
        .pets
        .firstWhere((element) => element.petid == widget.id);
    final st = TextStyle(
        color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500);
    final styl = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500);

    final sty = TextStyle(
        color: Colors.white70, fontSize: 26, fontWeight: FontWeight.bold);
    final style = TextStyle(
        fontStyle: FontStyle.italic,
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
                  image: NetworkImage(detaildata.photo),
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
                  )),
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
                                detaildata.name,
                                style: st,
                              ),
                              Text(detaildata.breed, style: styl),
                              Text(detaildata.species),
                            ]),
                        Text(
                          'Rs:',
                          style: sty,
                        )
                      ]),
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
                              Text(detaildata.sex, style: style2),
                              Text(
                                'Sex',
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
                              Text(detaildata.age, style: style2),
                              Text(
                                'Age',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Container(
                          width: size.width * 0.25,
                          height: size.height * 0.10,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(19),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(detaildata.dob, style: style2),
                              Text('DOB'),
                            ],
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
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
                                detaildata.color,
                                style: style2,
                              ),
                              Text('Colour'),
                            ],
                          ),
                        )
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
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(detaildata.behaviour),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(detaildata.notes),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(detaildata.diet),
                        SizedBox(height: size.height * 0.03),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 30,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                      backgroundColor: Colors.white),
                                  onPressed: () async {
                                    pet.addItemToFavourites(
                                        petid: detaildata.petid.toString(),
                                        userid: user.currentUserId.toString());
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FavouriteDesgin(),
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.favorite_border_outlined,
                                    size: 30,
                                    color: Colors.grey.withRed(20),
                                  ),
                                ),
                              ),
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    shadowColor: Colors.black,
                                    backgroundColor: const Color.fromARGB(
                                        255, 100, 134, 162)),
                                onPressed: () async {
                                  adopt.addAdoptPet(
                                      userid: user.currentUserId,
                                      petid: detaildata.petid);

                                  await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Adoptdesign()));
                                },
                                icon: Icon(Icons.pets,
                                    size: 30, color: Colors.white),
                                label: Text('adopt', style: style1),
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
