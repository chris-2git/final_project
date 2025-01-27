import 'package:final_project/Pets%20Adoption%20App/favouriteApi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favwidget extends StatefulWidget {
  final String favId;
  final String petid;
  final String name;
  final String species;
  final String breed;
  final String age;
  final String sex;
  final String color;
  final String weight;
  final String dob;
  final String microchipid;
  final String aid;
  final String diet;
  final String behaviour;
  final String status;
  final String notes;
  final String addeddate;
  final String photo;
  const Favwidget(
      {super.key,
      required this.favId,
      required this.petid,
      required this.name,
      required this.species,
      required this.breed,
      required this.age,
      required this.sex,
      required this.color,
      required this.weight,
      required this.dob,
      required this.microchipid,
      required this.aid,
      required this.diet,
      required this.behaviour,
      required this.status,
      required this.notes,
      required this.addeddate,
      required this.photo});

  @override
  State<Favwidget> createState() => _FavwidgetState();
}

class _FavwidgetState extends State<Favwidget> {
  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<FavPetsProvider>(context);
    final sty = TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    );
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            image: DecorationImage(
                image: NetworkImage(
                  widget.photo,
                ),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                      onPressed: () {
                        pet.deleteFav(widget.favId, context);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.grey.withRed(9),
                      )),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.grey.withRed(9),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name:${widget.name}',
                  style: sty,
                ),
                SizedBox(height: 10),
                Text(
                  'Breed:${widget.breed}',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
