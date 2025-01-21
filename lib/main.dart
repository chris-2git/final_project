import 'package:final_project/Pets%20Adoption%20App/adoptionAPI.dart';
import 'package:final_project/Pets%20Adoption%20App/adoptionDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/apiHome.dart';

import 'package:final_project/Pets%20Adoption%20App/categoryApi.dart';
import 'package:final_project/Pets%20Adoption%20App/categoryDesign.dart';
import 'package:final_project/Pets%20Adoption%20App/detailedpage.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteApi.dart';
import 'package:final_project/Pets%20Adoption%20App/favouriteDesign.dart';

import 'package:final_project/Pets%20Adoption%20App/page1.dart';
import 'package:final_project/Pets%20Adoption%20App/page3home.dart';
import 'package:final_project/Pets%20Adoption%20App/profileDesgin.dart';
import 'package:final_project/Pets%20Adoption%20App/sepratedApi.dart';
import 'package:final_project/Pets%20Adoption%20App/sepratedDesign.dart';
import 'package:final_project/profileAPI.dart';

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
        ),
        ChangeNotifierProvider(
          create: (context) => SepratedPetsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AdoptProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfilePetsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Page1(),
        routes: {
          "Petdetails": (context) => Homepage(),
          'pets': (context) => CategoryDesgin(),
          'favpets': (context) => FavouriteDesgin(),
          'adopt': (context) => Adoptdesign(),
          'Seprated': (context) => SepratedDesgin(
                categoryid: 'category_id',
              ),
          'profile': (context) => Profilepage(),
          'detailscreen': (context) {
            String id = ModalRoute.of(context)!.settings.arguments.toString();
            return Detailpage(
              id: id,
            );
          },
        },
      ),
    );
  }
}
