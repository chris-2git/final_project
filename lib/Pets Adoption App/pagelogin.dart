import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:final_project/Pets%20Adoption%20App/page2.dart';
import 'package:final_project/Pets%20Adoption%20App/pagereg.dart';
import 'package:final_project/profileAPI.dart';
import 'package:final_project/profileModel.dart';

class Pagelogin extends StatefulWidget {
  const Pagelogin({super.key});

  @override
  State<Pagelogin> createState() => _PageloginState();
}

class _PageloginState extends State<Pagelogin> {
  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure;
    });
  }

  Future<void> loginPage(String email, String password) async {
    const url =
        'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/login.php';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: {'email': email, 'password': password},
      );
      var jsonData = json.decode(response.body);

      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          List user = jsonData['userDetails'];
          if (user.isNotEmpty) {
            Profilemodel userData = Profilemodel.fromJson(user[0]);
            String userId = userData.userid;
            Provider.of<ProfilePetsProvider>(context, listen: false)
                .setCurrentUserId(userId);
          }

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Page2()));
          ScaffoldMessenger.of(context)
              .showSnackBar(_buildSnackBar('Login successful', Colors.green));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              _buildSnackBar('Invalid email or password', Colors.red));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(_buildSnackBar(
            'Server error. Please try again later.', Colors.red));
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
          _buildSnackBar('An error occurred. Please try again.', Colors.red));
    }
  }

  SnackBar _buildSnackBar(String message, Color color) {
    return SnackBar(
      backgroundColor: color,
      content: Text(
        message,
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      duration: const Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/pets4.jpg'),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: emailController,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your email'
                          : null,
                      decoration:
                          _buildInputDecoration('Email', Icons.email_outlined),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: _isObscure,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter your password'
                          : null,
                      decoration: _buildInputDecoration('Password', Icons.lock,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: _toggleVisibility,
                          )),
                    ),
                  ),
                  SizedBox(height: size.height * 0.04),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        loginPage(
                            emailController.text, passwordController.text);
                      }
                    },
                    child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.withOpacity(0.4),
                      ),
                      child: const Center(
                        child: Text('Login',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 17)),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.15),
                  const Text("Don't have an account?",
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.bold)),
                  SizedBox(height: size.height * 0.01),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Pageregister())),
                    child: const Text('Register here',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hintText, IconData icon,
      {Widget? suffixIcon}) {
    return InputDecoration(
      fillColor: Colors.grey.withOpacity(0.3),
      filled: true,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.black, fontSize: 20),
      prefixIcon: Icon(icon, color: Colors.black),
      suffixIcon: suffixIcon,
    );
  }
}
