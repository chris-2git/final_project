import 'package:final_project/Pets%20Adoption%20App/categoryApi.dart';
import 'package:final_project/Pets%20Adoption%20App/categoryWidget.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CategoryDesgin extends StatefulWidget {
  static const routename = 'pets';
  const CategoryDesgin({
    super.key,
  });

  @override
  State<CategoryDesgin> createState() => _CategoryDesginScreenState();
}

class _CategoryDesginScreenState extends State<CategoryDesgin> {
  void initState() {
    Provider.of<CategoryPetsProvider>(context, listen: false)
        .CategoriesData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final pet = Provider.of<CategoryPetsProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: pet.loadingSpinner
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(
                  color: Colors.green,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          : pet.pets.isEmpty
              ? Text('Loading...')
              : SizedBox(
                  height: size.height * 0.9,
                  child: GridView.builder(
                    itemCount: pet.pets.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      return Categorywidget(
                        id: pet.pets[index].id,
                        name: pet.pets[index].name,
                        photo: pet.pets[index].photo,
                      );
                    },
                  ),
                ),
    );
  }
}
