import 'package:final_project/Pets%20Adoption%20App/sepratedApi.dart';
import 'package:final_project/Pets%20Adoption%20App/sepratedDesign.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Criclewid extends StatefulWidget {
  final String id;
  final String name;
  final String photo;
  const Criclewid({
    super.key,
    required this.id,
    required this.name,
    required this.photo,
  });

  @override
  State<Criclewid> createState() => _CriclewidState();
}

class _CriclewidState extends State<Criclewid> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SepratedDesgin(categoryid: widget.id),
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withRed(9),
              radius: 34,
              backgroundImage: NetworkImage(
                widget.photo,
              ),
            ),
          ),
          Text(widget.name),
        ],
      ),
    );
  }
}
