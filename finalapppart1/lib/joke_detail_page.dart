import 'package:flutter/material.dart';
import 'joke.dart'; 

class JokeDetailPage extends StatelessWidget {
  final Joke joke;

  JokeDetailPage({required this.joke});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke Details'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Category: ${joke.category}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Setup: ${joke.setup}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Delivery: ${joke.delivery}',
              style: TextStyle(fontSize: 18),
            ),
            Divider(),
            ...joke.details.flags.entries.map((entry) => 
              Text('${entry.key}: ${entry.value}', style: TextStyle(fontSize: 18))
            ).toList(),
            // Add other properties here
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Return to previous screen (jokes list)
              },
              child: Text('Return to Jokes List'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
