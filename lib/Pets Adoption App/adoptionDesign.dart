import 'package:final_project/Pets%20Adoption%20App/adoptionAPI.dart';
import 'package:final_project/Pets%20Adoption%20App/adoptionWidget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Adoptdesign extends StatefulWidget {
  static const routename = 'adopt';
  const Adoptdesign({
    super.key,
  });

  @override
  State<Adoptdesign> createState() => _AdoptdesignState();
}

class _AdoptdesignState extends State<Adoptdesign> {
  void initState() {
    Provider.of<AdoptProvider>(context, listen: false)
        .adoptData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<AdoptProvider>(context);
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
                  child: ListView.builder(
                    itemCount: pet.pets.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Adoptwidget(
                        orderId: pet.pets[index].orderId,
                        petId: pet.pets[index].petId,
                        userId: pet.pets[index].userId,
                        orderStatus: pet.pets[index].orderStatus,
                        date: pet.pets[index].date,
                        name: pet.pets[index].name,
                        species: pet.pets[index].species,
                        breed: pet.pets[index].breed,
                        age: pet.pets[index].age,
                        sex: pet.pets[index].sex,
                        color: pet.pets[index].color,
                        weight: pet.pets[index].weight,
                        dob: pet.pets[index].dob,
                        microchipid: pet.pets[index].microchipid,
                        diet: pet.pets[index].diet,
                        behaviour: pet.pets[index].behaviour,
                        petStatus: pet.pets[index].petStatus,
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
