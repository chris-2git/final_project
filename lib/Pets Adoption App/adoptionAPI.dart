import 'dart:convert';
import 'dart:io';

import 'package:final_project/Pets%20Adoption%20App/adoptionModel.dart';
import 'package:final_project/Pets%20Adoption%20App/page2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;

class AdoptProvider with ChangeNotifier {
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

  List<Adoptmodel> _pet = [];
  List<Adoptmodel> get pets {
    return [..._pet];
  }

  Future adoptData({required BuildContext context, String? userid}) async {
    try {
      _isLoading = true;

      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_adoption_status.php?user_id=$userid"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/view_adoption_status.php?user_id=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pet = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> Category = extractedData["orders"];
        for (var i = 0; i < Category.length; i++) {
          _pet.add(
            Adoptmodel(
              orderId: Category[i]['order_id'].toString(),
              petId: Category[i]['pet_id'].toString(),
              userId: Category[i]['user_id'].toString(),
              orderStatus: Category[i]['order_status'].toString(),
              date: Category[i]['date'].toString(),
              name: Category[i]['name'].toString(),
              species: Category[i]['species'].toString(),
              breed: Category[i]['breed'].toString(),
              age: Category[i]['age'].toString(),
              sex: Category[i]['sex'].toString(),
              color: Category[i]['color'].toString(),
              weight: Category[i]['weight'].toString(),
              dob: Category[i]['dob'].toString(),
              microchipid: Category[i]['microchipid'].toString(),
              diet: Category[i]['diet'].toString(),
              behaviour: Category[i]['behaviour'].toString(),
              petStatus: Category[i]['pet_status'].toString(),
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

  Future<void> addAdoptPet(
      {String? petid, String? userid, BuildContext? context}) async {
    var body = {
      'petid': petid.toString(),
      'user_id': userid.toString(),
    };

    try {
      var response = await https.post(
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/adopt_now.php?user_id=$userid&petid=$petid'),
          body: body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context!).showSnackBar(SnackBar(
          backgroundColor: Colors.grey.withRed(9),
          content: Text('Adopted here'),
          duration: Duration(seconds: 5),
        ));
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
