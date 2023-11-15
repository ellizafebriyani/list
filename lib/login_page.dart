import 'package:flutter/material.dart';
import 'package:list/data_product.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 227, 147, 241),
      appBar: AppBar(
        title: Text('CAKE BAKERY WEBSITE'),
        backgroundColor: const Color.fromARGB(255, 130, 8, 152),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),

            // logo
            const Icon(
              Icons.cake,
              size: 100,
            ),

            const SizedBox(height: 50),

            // 'Bake a cake. Just cake! Let us create joy for you!'
            Text(
              'Bake a cake. Just cake! Let us create joy for you!',
              style: TextStyle(
                color: const Color.fromARGB(255, 59, 56, 56),
                fontSize: 18,
              ),
            ),

            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your authentication logic here
                String username = _usernameController.text;
                String password = _passwordController.text;

                // For simplicity, just check if the username and password are not empty
                if (username.isNotEmpty && password.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataProduct()),
                  );
                } else {
                  // Show an error message or handle invalid credentials
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Invalid credentials. Please try again.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
