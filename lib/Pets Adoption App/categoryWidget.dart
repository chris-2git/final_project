import 'package:final_project/Pets%20Adoption%20App/sepratedDesign.dart';

import 'package:flutter/material.dart';

class Categorywidget extends StatefulWidget {
  final String id;
  final String name;
  final String photo;
  const Categorywidget({
    super.key,
    required this.id,
    required this.name,
    required this.photo,
  });

  @override
  State<Categorywidget> createState() => _CategorywidgetState();
}

class _CategorywidgetState extends State<Categorywidget> {
  @override
  Widget build(BuildContext context) {
    final sty = TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w100,
      fontStyle: FontStyle.normal,
    );
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 300,
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SepratedDesgin(
                      categoryid: widget.id,
                    ),
                  ));
            },
            child: Container(
              width: size.width * 0.400,
              height: size.height * 0.240,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(widget.photo),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              width: size.width * 400,
              height: size.height * 0.080,
              child: Text(
                widget.name,
                style: sty,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
