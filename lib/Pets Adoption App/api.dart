import 'dart:convert';
import 'dart:io';

import 'package:final_project/Pets%20Adoption%20App/apimodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class PetsProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get islOading {
    return _isLoading;
  }

  final bool _loadingSpinner = false;
  bool get loadingSpinner {
    return _loadingSpinner;
  }

  bool _isSelect = false;

  bool get isSelect {
    return _isSelect;
  }

  final bool _isError = false;

  bool get isError {
    return _isError;
  }

  List<PetDetails> _pet = [];
  List<PetDetails> get pets {
    return [..._pet];
  }

  Future CategoriesData({required BuildContext context}) async {
    try {
      _isLoading = true;
      // var headers = {'Cookie': 'ci_session=c7lis868nec6nl8r1lb5el72q8n26upv'};
      var response = await https.get(
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php"),
      );

      print("https://www.themealdb.com/api/json/v1/1/categories.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pet = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> Category = extractedData["categories"];
        for (var i = 0; i < Category.length; i++) {
          _pet.add(
            PetDetails(
              petid: Category[i]['petid'].toString(),
              name: Category[i]['name'].toString(),
              species: Category[i]['species'].toString(),
              breed: Category[i]['breed'].toString(),
              age: Category[i]['age'].toString(),
              sex: Category[i]['sex'].toString(),
              color: Category[i]['color'].toString(),
              weight: Category[i]['weight'].toString(),
              dob: Category[i]['dob'].toString(),
              microchipid: Category[i]['microchipid'].toString(),
              aid: Category[i]['aid'].toString(),
              diet: Category[i]['diet'].toString(),
              behaviour: Category[i]['behaviour'].toString(),
              status: Category[i]['status'].toString(),
              notes: Category[i]['notes'].toString(),
              addeddate: Category[i]['addeddate'].toString(),
              photo: Category[i]['photo'].toString(),
            ),
          );
        }
        ;

        print('product details' + _pet.toString());
        _isLoading = false;
        print('products loading completed --->' + 'loading data');
        notifyListeners();
      } else {
        _isLoading = true;
        notifyListeners();
      }
    } on HttpException catch (e) {
      print('error in product prod -->>' + e.toString());
      print('Product Data is one by one loaded the product' + e.toString());
      _isLoading = false;

      _isSelect = false;
      notifyListeners();
    }
  }
}
