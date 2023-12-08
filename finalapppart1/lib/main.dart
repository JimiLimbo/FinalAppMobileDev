import 'package:flutter/material.dart';
import 'about_page.dart';
import 'storage_service.dart';

void main() {
  runApp(MyApp());
  StorageService().saveCredentials('admin', 'paSSw0rd');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokester',
      theme: ThemeData(
      ),
      home: LoginPage(), 
    );
  }
}


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final StorageService _storageService = StorageService();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Jokester')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Log In'),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text('Version 1.0.1'),  // Set your version here
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutPage()), // Define AboutPage
                    );
                  },
                  child: Text('About'),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  void _login() async {
    Map<String, String>? credentials = await _storageService.getCredentials();

    if (credentials != null &&
      _usernameController.text == credentials['username'] &&
      _passwordController.text == credentials['password']) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login success')),
      );
      // Navigate to another screen if needed
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }
}
