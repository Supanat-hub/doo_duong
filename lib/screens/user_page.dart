import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';

// ignore: camel_case_types
class userPage extends StatelessWidget {
  const userPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Word from JSON',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RandomWordPage(),
    );
  }
}

class RandomWordPage extends StatefulWidget {
  const RandomWordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RandomWordPageState createState() => _RandomWordPageState();
}

class _RandomWordPageState extends State<RandomWordPage> {
  List<String>? _words;

  @override
  void initState() {
    super.initState();
    _loadWords();
  }

  Future<void> _loadWords() async {
    String jsonString =
        await DefaultAssetBundle.of(context).loadString('assets/words.json');
    List<dynamic> jsonList = json.decode(jsonString);
    setState(() {
      _words = List<String>.from(jsonList);
    });
  }

  String _getRandomWord() {
    if (_words == null || _words!.isEmpty) {
      return 'No words loaded';
    }
    final random = Random();
    return _words![random.nextInt(_words!.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Word'),
        backgroundColor: Color.fromARGB(255, 160, 65, 255),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: _words == null
              ? const CircularProgressIndicator()
              : ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Random Word'),
                          content: Text(_getRandomWord()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'รับคำทำนาย',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
        ),
      ),
    );
  }
}
