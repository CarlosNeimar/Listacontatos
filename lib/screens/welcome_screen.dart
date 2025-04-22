import 'package:flutter/material.dart';
import 'contact_list_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo estilizada
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: 'Contatos'),
                  TextSpan(
                    text: '+',
                    style: TextStyle(
                      color: Colors.amber[700],
                      fontSize: 45,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Organize seus contatos com facilidade',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => ContactListScreen()),
                );
              },
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
