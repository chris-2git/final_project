import 'dart:convert';
import 'dart:io';

import 'package:final_project/Pets%20Adoption%20App/favouriteModel.dart';
import 'package:final_project/profileAPI.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:provider/provider.dart';

class FavPetsProvider with ChangeNotifier {
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

  List<Favmodel> _pet = [];
  List<Favmodel> get pets {
    return [..._pet];
  }

  Future FavData({BuildContext? context, String? userid}) async {
    try {
      _isLoading = true;

      var response = await https.get(
        Uri.parse(
            "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewfavpets.php?aid=$userid"),
      );

      print(
          "http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/viewfavpets.php?aid=$userid");

      print(response.body);

      if (response.statusCode == 200) {
        _isLoading = false;
        _pet = [];
        var extractedData = json.decode(response.body);

        final List<dynamic> Category = extractedData["petDetails"];
        for (var i = 0; i < Category.length; i++) {
          _pet.add(
            Favmodel(
              favId: Category[i]['fav_id'].toString(),
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

  Future<void> deleteFav(String? favId, BuildContext context) async {
    final user = Provider.of<ProfilePetsProvider>(context, listen: false);
    final url = Uri.parse(
        'http://campus.sicsglobal.co.in/Project/PetAdoption/api/delete_fav.php?fid=$favId');

    try {
      final response = await https.delete(url);
      print(url);
      if (response.statusCode == 200) {
        FavData(
          userid: user.currentUserId,
        );

        print('Cart deleted successfully');
      } else {
        print('Failed to delete cart: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }

  Future<void> addItemToFavourites({String? petid, String? userid}) async {
    var body = {
      'petid': petid.toString(),
      'aid': userid.toString(),
    };

    try {
      var response = await https.post(
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/addfavpet.php?aid=$userid&petid=$petid'),
          body: body);

      if (response.statusCode == 200) {
        print('Added to cart successfully');
        print('Response: ${response.body}');
      } else {
        print('Failed to add to cart. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Failed to add to cart. Exception: $e');
    }
  }
}
