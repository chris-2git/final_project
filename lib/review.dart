import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withRed(9),
        title: Text(
          'Reviews',
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Rate this App',
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              itemCount: 5,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print('Rating: $rating');
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: size.width * double.infinity,
                height: size.height * 0.400,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Text('Write your feedback about this app...'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
