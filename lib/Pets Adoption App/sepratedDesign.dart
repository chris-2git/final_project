import 'package:final_project/Pets%20Adoption%20App/sepratedApi.dart';
import 'package:final_project/Pets%20Adoption%20App/sepratedWidget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SepratedDesgin extends StatefulWidget {
  final String categoryid;
  static const routename = 'Seprated';
  const SepratedDesgin({
    super.key,
    required this.categoryid,
  });

  @override
  State<SepratedDesgin> createState() => _SepratedDesginScreenState();
}

class _SepratedDesginScreenState extends State<SepratedDesgin> {
  @override
  void initState() {
    Provider.of<SepratedPetsProvider>(context, listen: false)
        .SepData(context: context, categoryid: widget.categoryid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<SepratedPetsProvider>(context);
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
              ? Center(child: Text('No Pets...'))
              : SizedBox(
                  height: size.height * 0.9,
                  child: GridView.builder(
                    itemCount: pet.pets.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.4),
                    itemBuilder: (context, index) {
                      return SepratedWid(
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
                          photo: pet.pets[index].photo);
                    },
                  ),
                ),
    );
  }
}
