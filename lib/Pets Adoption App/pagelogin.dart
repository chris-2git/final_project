import 'package:final_project/Pets%20Adoption%20App/page2.dart';
import 'package:final_project/Pets%20Adoption%20App/pagereg.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Pagelogin extends StatefulWidget {
  const Pagelogin({super.key});

  @override
  State<Pagelogin> createState() => _PageloginState();
}

class _PageloginState extends State<Pagelogin> {
  // final _formKey = GlobalKey<FormState>();

  // TextEditingController emailcontroller = TextEditingController();
  // TextEditingController passwordcontroller = TextEditingController();

  // Future<void> loginpage(String email, String password) async {
  //   const Uri =
  //       ('http://campus.sicsglobal.co.in/Project/homemade_crafts/API/login.php');
  //   Map<String, String> body = {
  //     'email': email,
  //     'password': password,
  //   };

  //   try {
  //     final response = await http.post(
  //       Uri.parse(url),
  //       body: body,
  //     );
  //     print(url);
  //     var jsonData = json.decode(response.body);
  //     print(jsonData);
  //     print(jsonData["status"]);
  //     if (response.statusCode == 200) {
  //       if (jsonData['status'] == true) {
  //         ScaffoldMessenger.of(
  //           context.showSnackBar(SnackBar(
  //             backgroundColor: Colors.green,
  //             content: const Text(
  //               'Login Successfully!',
  //               style:
  //                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //             ),
  //             duration: const Duration(seconds: 4),
  //           )),
  //         );
  //         Navigator.push(context,
  //             MaterialPageRoute(builder: (context) => const Pagelogin()));
  //         print(body);
  //         print("Response body${response.body}");
  //         print("Response body${response.body}");
  //       } else if (jsonData['status'] == false) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             backgroundColor: Colors.amber,
  //             content: const Text(
  //               'Invalid phone and password',
  //               style:
  //                   TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //             ),
  //             duration: const Duration(seconds: 4),
  //           ),
  //         );
  //         print('Error: ${response.statusCode}');
  //       }
  //     } else {
  //       print('fffff');
  //     }
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final sty = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w900,
      fontSize: 15,
    );
    final styl = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 18,
      fontStyle: FontStyle.normal,
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/pets4.jpg'),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('login'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.grey.withOpacity(0.3),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          18,
                        ),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Page2()));
                  },
                  child: Container(
                    width: size.width * 0.300,
                    height: size.height * 0.09,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.withOpacity(0.4),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
                Text(
                  'Dont have an account?',
                  style: sty,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Pageregister(),
                        ));
                  },
                  child: Text(
                    'Register here',
                    style: styl,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
