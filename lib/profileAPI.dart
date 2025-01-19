import 'dart:convert';
import 'dart:io';

import 'package:final_project/profileModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class ProfilePetsProvider with ChangeNotifier {
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

  List<Profilemodel> _pet = [];
  List<Profilemodel> get pets {
    return [..._pet];
  }

  Future ProfileData({required BuildContext context}) async {
    try {
      _isLoading = true;

      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_profile.php?user_id=1"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_profile.php?user_id=1");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pet = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> Category = extractedData["userDetails"];
        for (var i = 0; i < Category.length; i++) {
          _pet.add(
            Profilemodel(
              firstname: Category[i]['firstname'].toString(),
              lastname: Category[i]['lastname'].toString(),
              dob: Category[i]['dob'].toString(),
              phone: Category[i]['phone'].toString(),
              email: Category[i]['email'].toString(),
              address: Category[i]['address'].toString(),
              gender: Category[i]['gender'].toString(),
              userid: Category[i]['userid'].toString(),
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
