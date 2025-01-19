import 'dart:convert';
import 'dart:io';

import 'package:final_project/Pets%20Adoption%20App/apimodelHome.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:provider/provider.dart';

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

  List<PetDetails> _serach = [];
  List<PetDetails> get serach {
    return [..._serach];
  }

  List<PetDetails> _fliter = [];
  List<PetDetails> get fliter {
    return [..._fliter];
  }

  Future allCategoriesData({required BuildContext context}) async {
    try {
      _isLoading = true;

      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewallpets.php"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewallpets.php");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pet = [];
        _fliter = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> Category = extractedData["petDetails"];
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

  Future allserachData({required BuildContext context, dynamic keyword}) async {
    try {
      _isLoading = true;

      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/search_pet.php?keyword=$keyword"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/search_pet.php?keyword=$keyword");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _serach = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> Category = extractedData["petDetails"];
        for (var i = 0; i < Category.length; i++) {
          _serach.add(
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

        print('product details' + _serach.toString());
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
