import 'dart:math';

import 'package:final_project/Pets%20Adoption%20App/profileDesgin.dart';
import 'package:final_project/profileAPI.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController DOBcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController numcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null && picked != DateTime.now()) {
        String formattedDate = "${picked.year}-${picked.month}-${picked.day}";
        DOBcontroller.text = formattedDate;
      }
    }

    Future<dynamic> updateProfileApi() async {
      try {
        final user = Provider.of<ProfilePetsProvider>(context, listen: false);
        var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/edit_profile.php'),
        );
        print(
            'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/edit_profile.php');
        request.fields.addAll({
          'firstname': namecontroller.text.trim(),
          'address': addresscontroller.text.trim(),
          'dob': DOBcontroller.text.trim(),
          'email': emailcontroller.text.trim(),
          'phone': numcontroller.text.trim(),
          'password': '123',
          'gender': 'Male',
          'user_id': user.currentUserId ?? "1"
        });
        // if (image != null) {
        //   request.files
        //       .add(await http.MultipartFile.fromPath('image', image!.path));
        // }
        http.StreamedResponse response = await request.send();

        print(await response.stream.bytesToString());
        print(""" 'firstname': ${namecontroller.text.trim()},
             'address': ${addresscontroller.text.trim()},
             'dob':${DOBcontroller.text.trim()},
             'email': 'mailto:jose@gmail.com',
        'phone': ${numcontroller.text.trim()},
        
        'password': '123',
        'gender':'Male',
        'user_id': ${user.currentUserId}?? "1" """);
        if (response.statusCode == 200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.grey.withRed(9),
              content: const Text(
                "Profile Updated successfully...!",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )));
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Profilepage()));

          print(await response.stream.bytesToString());
        } else {
          print(response.reasonPhrase);
        }
      } catch (e) {
        print(e);
      }
    }

    final sty = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        'assets/profile1.jpg',
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 85,
                      right: 30,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.grey.withRed(9),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              editContainer(
                Icons.person,
                'Edit Name',
                Colors.black,
                () {},
                namecontroller,
              ),
              editContainer(
                Icons.abc,
                'Edit Address',
                Colors.black,
                () {},
                addresscontroller,
              ),
              editContainer(
                Icons.calendar_today,
                'Edit DOB',
                Colors.black,
                () {
                  _selectDate(context);
                },
                DOBcontroller,
              ),
              editContainer(
                Icons.email,
                'Edit Email',
                Colors.black,
                () {},
                emailcontroller,
              ),
              editContainer(
                Icons.phone,
                'Edit Number',
                Colors.black,
                () {},
                numcontroller,
              ),
              SizedBox(height: size.height * 0.04),
              GestureDetector(
                onTap: () {
                  updateProfileApi();
                },
                child: Container(
                  width: size.width * 0.40,
                  height: size.height * 0.080,
                  decoration: BoxDecoration(
                    color: Colors.grey.withRed(9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Save',
                      style: sty,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget editContainer(IconData icon, String name, Color newcolor,
      VoidCallback ontap, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: name,
            prefixIcon: IconButton(onPressed: ontap, icon: Icon(icon))),
      ),
    );
  }
}
