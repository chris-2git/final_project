import 'package:flutter/material.dart';

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
          width: size.width * 0.500,
          height: size.height * 0.300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            image: DecorationImage(
                image: NetworkImage(
                  widget.photo,
                ),
                fit: BoxFit.cover),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.close)),
            ],
          ),
        ),
        Container(
          width: size.width * 0.500,
          height: size.height * 0.200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            color: Colors.grey.withRed(9),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name:${widget.name}',
                  style: sty,
                ),
                Text(
                  'Breed:${widget.breed}',
                ),
                Text('Diet:${widget.diet}'),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month,
                        color: Colors.black,
                      ),
                    ),
                    Text('DOB:${widget.dob}')
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
