import 'package:final_project/Pets%20Adoption%20App/pagelogin.dart';
import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    super.initState();
    -navigatehome();
  }

  navigatehome() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Pagelogin()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/BN.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
