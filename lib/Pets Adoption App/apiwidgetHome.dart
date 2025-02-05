import 'package:final_project/Pets%20Adoption%20App/detailedpage.dart';
import 'package:flutter/material.dart';

class PetWidget extends StatefulWidget {
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

  const PetWidget({
    Key? key,
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
    required this.photo,
  }) : super(key: key);

  @override
  State<PetWidget> createState() => _PetWidgetState();
}

class _PetWidgetState extends State<PetWidget> {
  @override
  Widget build(BuildContext context) {
    final style1 = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    );
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detailpage(id: widget.petid)));
          },
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(
                  20,
                ),
              ),
              image: DecorationImage(
                  image: NetworkImage(widget.photo), fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.grey.withRed(9),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Text(
                widget.name,
              ),
              Text(widget.breed)
            ],
          ),
        )
      ],
    );
  }
}
