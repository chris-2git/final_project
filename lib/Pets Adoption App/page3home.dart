import 'package:final_project/Pets%20Adoption%20App/apiHome.dart';
import 'package:final_project/Pets%20Adoption%20App/apiwidgetHome.dart';
import 'package:final_project/Pets%20Adoption%20App/categoryApi.dart';
import 'package:final_project/Pets%20Adoption%20App/criclewidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  static const routename = "Petdetails";
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  void initState() {
    Provider.of<PetsProvider>(context, listen: false)
        .allCategoriesData(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<PetsProvider>(context);
    final category = Provider.of<CategoryPetsProvider>(context);

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
                controller: searchcontroller,
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
                onChanged: (value) {
                  if (value != '') {
                    String searchquery = value.toLowerCase();
                    pet.allserachData(context: context, keyword: searchquery);
                  }
                },
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
                  itemCount: category.pets.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Criclewid(
                      id: category.pets[index].id,
                      name: category.pets[index].name,
                      photo: category.pets[index].photo,
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
                      : pet.serach.isEmpty && searchcontroller.text.isNotEmpty
                          ? Center(
                              child: Center(
                                  child: Text(
                                'No Pets Avaliable',
                                style: TextStyle(color: Colors.black),
                              )),
                            )
                          : searchcontroller.text.isNotEmpty &&
                                  pet.serach.isNotEmpty
                              ? SizedBox(
                                  height: size.height * 0.9,
                                  child: GridView.builder(
                                    itemCount: pet.serach.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 15,
                                            mainAxisSpacing: 15,
                                            childAspectRatio: 0.7),
                                    itemBuilder: (context, index) {
                                      return PetWidget(
                                        petid: pet.serach[index].petid,
                                        name: pet.serach[index].name,
                                        species: pet.serach[index].species,
                                        breed: pet.serach[index].breed,
                                        age: pet.serach[index].age,
                                        sex: pet.serach[index].sex,
                                        color: pet.serach[index].sex,
                                        weight: pet.serach[index].weight,
                                        dob: pet.serach[index].dob,
                                        microchipid:
                                            pet.serach[index].microchipid,
                                        aid: pet.serach[index].aid,
                                        diet: pet.serach[index].diet,
                                        behaviour: pet.serach[index].behaviour,
                                        status: pet.serach[index].status,
                                        notes: pet.serach[index].notes,
                                        addeddate: pet.serach[index].addeddate,
                                        photo: pet.serach[index].photo,
                                      );
                                    },
                                  ),
                                )
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
                                        microchipid:
                                            pet.pets[index].microchipid,
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
            ],
          ),
        ),
      ),
    );
  }
}
