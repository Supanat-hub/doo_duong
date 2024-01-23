import 'package:doo_duong/screens/login.dart';
import 'package:doo_duong/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(211, 239, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
              child: Text('Register / Login',
                  style: GoogleFonts.bebasNeue(
                      textStyle:
                          const TextStyle(letterSpacing: 1, fontSize: 30))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 50, 30, 50),
              child: Image.asset('assets/img/logo.png'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const RegisterScreen();
                      }));
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Singup'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor:
                            const Color.fromARGB(255, 78, 42, 255)),
                  ),
                ),
                SizedBox(
                  width: 160,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    },
                    icon: const Icon(Icons.login),
                    label: const Text('Login'),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                        backgroundColor: const Color.fromRGBO(103, 73, 253, 1)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
