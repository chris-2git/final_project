import 'package:flutter/material.dart';

class Adoptwidget extends StatefulWidget {
  final String orderId;
  final String petId;
  final String userId;
  final String orderStatus;
  final String date;
  final String name;
  final String species;
  final String breed;
  final String age;
  final String sex;
  final String color;
  final String weight;
  final String dob;
  final String microchipid;
  final String diet;
  final String behaviour;
  final String petStatus;
  final String notes;
  final String addeddate;
  final String photo;
  const Adoptwidget(
      {super.key,
      required this.orderId,
      required this.petId,
      required this.userId,
      required this.orderStatus,
      required this.date,
      required this.name,
      required this.species,
      required this.breed,
      required this.age,
      required this.sex,
      required this.color,
      required this.weight,
      required this.dob,
      required this.microchipid,
      required this.diet,
      required this.behaviour,
      required this.petStatus,
      required this.notes,
      required this.addeddate,
      required this.photo});

  @override
  State<Adoptwidget> createState() => _AdoptwidgetState();
}

class _AdoptwidgetState extends State<Adoptwidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width * 0.40,
            height: size.height * 0.20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
              image: DecorationImage(
                  image: NetworkImage(widget.photo), fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
          width: size.width * 0.55,
          height: size.height * 0.20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.grey.withRed(2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      'Name:',
                    ),
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Breed:',
                    ),
                    Text(
                      widget.breed,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey,
                      backgroundColor: Colors.blue.withRed(3)),
                  onPressed: () {},
                  icon: Icon(
                    Icons.change_circle,
                    color: Colors.black,
                  ),
                  label: Text(
                    widget.orderStatus,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
