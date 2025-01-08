import 'package:final_project/Pets%20Adoption%20App/apiHome.dart';
import 'package:final_project/Pets%20Adoption%20App/apiwidgetHome.dart';
import 'package:final_project/Pets%20Adoption%20App/categoryApi.dart';
import 'package:final_project/Pets%20Adoption%20App/categoryWidget.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteApi.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteWidget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class FavouriteDesgin extends StatefulWidget {
  static const routename = 'favpets';
  const FavouriteDesgin({
    super.key,
  });

  @override
  State<FavouriteDesgin> createState() => _FavouriteDesginScreenState();
}

class _FavouriteDesginScreenState extends State<FavouriteDesgin> {
  void initState() {
    Provider.of<FavPetsProvider>(context, listen: false)
        .FavData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<FavPetsProvider>(context);
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
              ? Text('Loading...')
              : SizedBox(
                  height: size.height * 0.9,
                  child: GridView.builder(
                    itemCount: pet.pets.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.5),
                    itemBuilder: (context, index) {
                      return Favwidget(
                        favId: pet.pets[index].favId,
                        petid: pet.pets[index].petid,
                        name: pet.pets[index].name,
                        species: pet.pets[index].species,
                        breed: pet.pets[index].breed,
                        age: pet.pets[index].age,
                        sex: pet.pets[index].sex,
                        color: pet.pets[index].color,
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
