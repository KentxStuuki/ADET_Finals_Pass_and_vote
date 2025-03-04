import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: PasswordGenerator(),
    );
  }
}

class PasswordGenerator extends StatefulWidget {
  @override
  _PasswordGeneratorState createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  String _password = '';
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890!@#%^&*';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(
    Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))),
  );

  void _generatePassword(String strength) {
    if (strength == 'Weak' || strength == 'weak') {
      _password = getRandomString(8);
    } else if (strength == 'Medium' || strength == 'medium') {
      _password = getRandomString(15);
    } else if (strength == 'Strong' || strength == 'strong') {
      _password = getRandomString(25);
    } else {
      _password = 'Invalid input. Please try again';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 47, 4, 75),
        title: const Text(
          'Password Generator by Mark Erolle D. Quiambao',
          style: TextStyle(color: Color.fromARGB(255, 222, 192, 131)),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Your Password:',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                _password,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,
                ),
                
              ),
              const SizedBox(
                height: 20,
                ), 
              ElevatedButton(
                onPressed: () => _generatePassword('weak'),
                child: const Text('Weak Password',), 
              ),
              ElevatedButton(
                onPressed: () => _generatePassword('medium'),
                child: const Text('Medium Password'),
              ),
              ElevatedButton(
                onPressed: () => _generatePassword('strong'),
                child: const Text('Strong Password'), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}