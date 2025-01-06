import 'package:final_project/Pets%20Adoption%20App/apiHome.dart';
import 'package:final_project/Pets%20Adoption%20App/apidesignHome.dart';
import 'package:final_project/Pets%20Adoption%20App/categoryApi.dart';
import 'package:final_project/Pets%20Adoption%20App/categoryDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteApi.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteDesign.dart';

import 'package:final_project/Pets%20Adoption%20App/page1.dart';
import 'package:final_project/Pets%20Adoption%20App/page3home.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PetsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryPetsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavPetsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Page1(),
        routes: {
          "Petdetails": (context) => Homepage(),
          'pets': (context) => CategoryDesgin(),
          'favpets': (context) => FavouriteDesgin(),
        },
      ),
    );
  }
}
