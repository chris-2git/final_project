import 'package:final_project/Pets%20Adoption%20App/page3home.dart';
import 'package:final_project/profileAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  void initState() {
    Provider.of<ProfilePetsProvider>(context, listen: false)
        .profileData(context: context);
    super.initState();
  }

  double _rating = 3.0;
  TextEditingController feedbackController = TextEditingController();

  String? currentUserId;

  Future<void> submitFeedback(String? userId, String message) async {
    if (userId == null || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('User ID or message cannot be empty.'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final response = await http.get(
        Uri.parse(
            'http://campus.sicsglobal.co.in/Project/PetAdoption_New/api/add_feedback.php?user_id=$userId&message=$message'),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Feedback submitted successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        // Navigate to Homepage after successful submission
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Homepage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to submit feedback. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withRed(9),
        title: Text('Reviews'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Rate this App',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 0,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
                print('Rating: $rating');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 200,
                child: TextField(
                  controller: feedbackController,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                submitFeedback(
                  currentUserId,
                  feedbackController.text.trim(),
                );
              },
              child: Text('Submit'),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width,
              height: size.height * 0.50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/feedback-1.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
