import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:final_project/Pets%20Adoption%20App/pagelogin.dart';

class Pageregister extends StatefulWidget {
  const Pageregister({super.key});

  @override
  State<Pageregister> createState() => _PageregisterState();
}

class _PageregisterState extends State<Pageregister> {
  bool _isObscure = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController dobcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      String formattedDate = "${picked.year}-${picked.month}-${picked.day}";
      setState(() {
        dobcontroller.text = formattedDate;
      });
    }
  }

  // Email Validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    String emailPattern = r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$';
    return RegExp(emailPattern).hasMatch(value) ? null : 'Enter a valid email';
  }

  // Password Validation
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    String passwordPattern =
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
    return RegExp(passwordPattern).hasMatch(value)
        ? null
        : 'Password must have:\n'
            '- 8+ characters\n'
            '- 1 uppercase letter\n'
            '- 1 lowercase letter\n'
            '- 1 number\n'
            '- 1 special character';
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
      final response = await http.post(Uri.parse(url), body: body);
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor:
                jsonData['status'] == true ? Colors.green : Colors.red,
            content: Text(
              jsonData['status'] == true
                  ? 'Registration Successful!'
                  : 'Invalid phone or password',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            duration: Duration(seconds: 3),
          ),
        );

        if (jsonData['status'] == true) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Pagelogin()));
        }
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pets1.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Your Account',
                    style: TextStyle(
                        color: Colors.grey.withRed(9),
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 25),
                  Sampletextform('Firstname', Icons.person, firstnamecontroller,
                      (value) {
                    return value!.isEmpty
                        ? 'Please enter your firstname'
                        : null;
                  }),
                  Sampletextform('Lastname', Icons.person, lastnamecontroller,
                      (value) {
                    return value!.isEmpty ? 'Please enter your lastname' : null;
                  }),
                  Sampletextform('DOB', Icons.calendar_month, dobcontroller,
                      (value) {
                    return value!.isEmpty ? 'Please enter your DOB' : null;
                  }, onTap: () => _selectDate(context)),
                  Sampletextform('Phone', Icons.phone, phonecontroller,
                      (value) {
                    return value!.isEmpty ? 'Please enter your phone' : null;
                  }),
                  Sampletextform(
                      'Email', Icons.email, emailcontroller, validateEmail),
                  Sampletextform('Password', Icons.lock, passwordcontroller,
                      validatePassword,
                      isPassword: true),
                  Sampletextform('Address', Icons.place, addresscontroller,
                      (value) {
                    return value!.isEmpty ? 'Please enter your address' : null;
                  }),
                  Sampletextform('Gender', Icons.male, gendercontroller,
                      (value) {
                    return value!.isEmpty ? 'Please enter your gender' : null;
                  }),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () {
                      if (formkey.currentState!.validate()) {
                        registerapi(
                          firstnamecontroller.text,
                          lastnamecontroller.text,
                          dobcontroller.text,
                          phonecontroller.text,
                          emailcontroller.text,
                          passwordcontroller.text,
                          addresscontroller.text,
                          gendercontroller.text,
                        );
                      }
                    },
                    child: Container(
                      height: 60,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey.withRed(9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
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
      {Function()? onTap,
      bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        controller: samplecontroller,
        obscureText: isPassword && _isObscure,
        readOnly: name == 'DOB',
        onTap: name == 'DOB' ? () => _selectDate(context) : onTap,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black),
          ),
          hintText: name,
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(icon, color: Colors.black),
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: _togglePasswordVisibility,
                )
              : null,
          fillColor: Colors.grey.withOpacity(0.2),
          filled: true,
        ),
        validator: validator,
      ),
    );
  }
}
