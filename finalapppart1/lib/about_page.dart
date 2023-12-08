import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'About This App',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to Jokester, the ultimate destination for every programmer who appreciates a good laugh! In the world of coding, where complexities and challenges are a daily encounter, a dash of humor is not just refreshing but necessary. That is precisely what Jokester brings to your fingertips, an endless stream of jokes tailored for the programming community.',
                textAlign: TextAlign.center,
              ),
              // You can add more content here as needed
            ],
          ),
        ),
      ),
    );
  }
}
