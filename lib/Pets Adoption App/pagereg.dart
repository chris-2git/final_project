import 'package:final_project/Pets%20Adoption%20App/pagelogin.dart';
import 'package:flutter/material.dart';

class Pageregister extends StatefulWidget {
  const Pageregister({super.key});

  @override
  State<Pageregister> createState() => _PageregisterState();
}

class _PageregisterState extends State<Pageregister> {
  @override
  Widget build(BuildContext context) {
    final Sty = TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.italic,
        fontSize: 16,
        fontWeight: FontWeight.w900);
    final Styl = TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.w500);
    final Style = TextStyle(
        color: Colors.white,
        fontStyle: FontStyle.normal,
        fontSize: 15,
        fontWeight: FontWeight.w500);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/petsall.webp'),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.7),
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        hintText: 'Frist name',
                        hintStyle: Sty,
                        fillColor: Colors.grey.withOpacity(0.7),
                        filled: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.9),
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        hintText: ' Last name',
                        hintStyle: Sty,
                        fillColor: Colors.grey.withOpacity(0.7),
                        filled: true),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        fillColor: Colors.grey.withOpacity(0.7),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: 'Email',
                        hintStyle: Sty),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey.withOpacity(0.7),
                        filled: true,
                        hintText: 'Password',
                        hintStyle: Sty),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Colors.black,
                        ),
                        fillColor: Colors.grey.withOpacity(0.7),
                        filled: true,
                        hintText: 'Phone No.',
                        hintStyle: Sty),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.46,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.7),
                    ),
                    color: Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(
                        20,
                        30,
                      ),
                      topRight: Radius.elliptical(20, 30),
                      bottomLeft: Radius.elliptical(20, 30),
                      bottomRight: Radius.elliptical(20, 30),
                    ),
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Register',
                      style: Styl,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: Style,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Pagelogin(),
                            ));
                      },
                      child: Text(
                        'Login',
                        style: Style,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
