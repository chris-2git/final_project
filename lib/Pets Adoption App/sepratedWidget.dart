import 'package:final_project/Pets%20Adoption%20App/detailedpage.dart';
import 'package:flutter/material.dart';

class SepratedWid extends StatefulWidget {
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
  const SepratedWid(
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
  State<SepratedWid> createState() => _SepratedWidState();
}

class _SepratedWidState extends State<SepratedWid> {
  @override
  Widget build(BuildContext context) {
    final sty = TextStyle(
      color: Colors.black,
      fontSize: 18,
    );
    final styl = TextStyle(
      color: Colors.black,
      fontSize: 12,
    );
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detailpage(id: widget.petid),
            ));
      },
      child: Column(
        children: [
          Container(
            width: size.width * 0.500,
            height: size.height * 0.350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.photo,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      style:
                          IconButton.styleFrom(backgroundColor: Colors.white),
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white.withRed(20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: size.width * 0.500,
            height: size.height * 0.270,
            decoration: BoxDecoration(
              color: Colors.grey.withRed(9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(
                  15,
                ),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Name: ${widget.name}',
                    style: sty,
                  ),
                  Text(
                    'Specie: ${widget.species}',
                    style: styl,
                  ),
                  Text(
                    'Breed: ${widget.breed}',
                    style: styl,
                  ),
                  Text('Sex: ${widget.sex}'),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month,
                      ),
                      label: Text(
                        '${widget.dob}',
                        style: styl,
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
