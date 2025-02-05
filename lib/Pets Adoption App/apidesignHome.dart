import 'package:final_project/Pets%20Adoption%20App/apiHome.dart';
import 'package:final_project/Pets%20Adoption%20App/apiwidgetHome.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Petsdesgin extends StatefulWidget {
  const Petsdesgin({
    super.key,
  });

  @override
  State<Petsdesgin> createState() => _PetsScreenState();
}

class _PetsScreenState extends State<Petsdesgin> {
  void initState() {
    Provider.of<PetsProvider>(context, listen: false)
        .allCategoriesData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<PetsProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: pet.loadingSpinner
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
              ? Text('loading...')
              : SizedBox(
                  height: size.height * 0.9,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.6),
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
    );
  }
}
