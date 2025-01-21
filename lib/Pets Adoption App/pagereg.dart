import 'dart:async';
import 'dart:convert';

import 'package:final_project/Pets%20Adoption%20App/pagelogin.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Pageregister extends StatefulWidget {
  const Pageregister({super.key});

  @override
  State<Pageregister> createState() => _PageregisterState();
}

class _PageregisterState extends State<Pageregister> {
  bool _isObscure = true;
  void _passlock() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != DateTime.now()) {
      String formattedDate = "${picked.year}-${picked.month}-${picked.day}";
      dobcontroller.text = formattedDate;
    }
  }

  Future<void> registerapi(
      String firstname,
      String lastname,
      String dob,
      String phone,
      String email,
      String password,
      String address,
      String gender) async {
    const url =
        'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/adopter_registration.php';

    Map<String, String> body = {
      'firstname': firstname,
      'lastname': lastname,
      'dob': dob,
      'phone': phone,
      'email': email,
      'password': password,
      'address': address,
      'gender': gender
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(
        jsonData["status"],
      );
      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber,
              content: const Text(
                'Register successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Pagelogin()));
          print(body);
          print("Response body${response.body}");

          print('Register successful');
        } else if (jsonData['status'] == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.amber,
              content: const Text(
                'Invalid phone and password',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 198, 185),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/petsall.webp',
                    ),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Your Account',
                    style: TextStyle(
                        color: Color.fromARGB(255, 183, 157, 146),
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Sampletextform('Firstname', Icons.person, firstnamecontroller,
                      (value) {
                    if (firstnamecontroller.text.isEmpty) {
                      return 'Please enter your firstname';
                    } else {
                      return null;
                    }
                  }, () {}),
                  Sampletextform('Lastname', Icons.person, lastnamecontroller,
                      (value) {
                    if (lastnamecontroller.text.isEmpty) {
                      return 'Please enter your lastname';
                    } else {
                      return null;
                    }
                  }, () {}),
                  Sampletextform('DOB', Icons.calendar_month, dobcontroller,
                      (value) {
                    if (dobcontroller.text.isEmpty) {
                      return 'Please enter your dob';
                    } else {
                      return null;
                    }
                  }, () {
                    _selectDate(context);
                  }),
                  Sampletextform('Phone', Icons.phone, phonecontroller,
                      (value) {
                    if (phonecontroller.text.isEmpty) {
                      return 'Please enter your phone';
                    } else {
                      return null;
                    }
                  }, () {}),
                  Sampletextform('Email', Icons.email, emailcontroller,
                      (value) {
                    if (emailcontroller.text.isEmpty) {
                      return 'Please enter your email';
                    } else {
                      return null;
                    }
                  }, () {}),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: 'Password',
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: _passlock,
                        ),
                        fillColor: Colors.white.withOpacity(0.5),
                        filled: true,
                      ),
                      obscureText: _isObscure,
                    ),
                  ),
                  Sampletextform('Address', Icons.place, addresscontroller,
                      (value) {
                    if (addresscontroller.text.isEmpty) {
                      return 'Please enter your address';
                    } else {
                      return null;
                    }
                  }, () {}),
                  Sampletextform('Gender', Icons.male, gendercontroller,
                      (value) {
                    if (gendercontroller.text.isEmpty) {
                      return 'Please enter your gender';
                    } else {
                      return null;
                    }
                  }, () {}),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        registerapi(
                          firstnamecontroller.text.toString(),
                          lastnamecontroller.text.toString(),
                          dobcontroller.text.toString(),
                          phonecontroller.text.toString(),
                          emailcontroller.text.toString(),
                          passwordcontroller.text.toString(),
                          addresscontroller.text.toString(),
                          gendercontroller.text.toString(),
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 140, 93, 76)
                            .withOpacity(0.8),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget Sampletextform(
      String name,
      IconData icon,
      TextEditingController samplecontroller,
      String? Function(String?)? validator,
      Function() onTap) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
          controller: samplecontroller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white),
            ),
            hintText: name,
            hintStyle: TextStyle(fontSize: 14),
            prefixIcon: GestureDetector(onTap: onTap, child: Icon(icon)),
            fillColor: Colors.white.withOpacity(0.5),
            filled: true,
          ),
          validator: validator),
    );
  }
}
