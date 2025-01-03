import 'package:flutter/material.dart';

class Petwidget extends StatefulWidget {
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

  const Petwidget(
      {super.key,
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
  State<Petwidget> createState() => _PetwidgetState();
}

class _PetwidgetState extends State<Petwidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
