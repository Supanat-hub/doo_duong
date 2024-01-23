import 'package:doo_duong/modules/profile.dart';
import 'package:doo_duong/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final fromkey = GlobalKey<FormState>();
  Profile profile = Profile(email: "", password: "", cmp: "", birtdate: "");
  Future<FirebaseApp> firebase = Firebase.initializeApp();
  @override
  build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            // Add your widget here for the case when the future completes successfully
            return Scaffold(
              appBar: AppBar(
                title: const Text('Register'),
                titleTextStyle: const TextStyle(
                    color: Color.fromRGBO(230, 229, 229, 1), fontSize: 20),
                centerTitle: true,
                backgroundColor: const Color.fromARGB(255, 74, 189, 255),
                shadowColor: const Color.fromRGBO(214, 247, 255, 1),
                elevation: 10,
              ),
              backgroundColor: const Color.fromRGBO(211, 239, 255, 1),
              // ignore: avoid_unnecessary_containers
              body: Container(
                child: Form(
                  key: fromkey,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                              child: Text(
                            "Fill this from to register.",
                            style: TextStyle(fontSize: 20),
                          )),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Email",
                                  hintText: "excample@mail.com",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                  ),
                                  prefixIconColor: Colors.deepPurple),
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'this field is required'),
                                EmailValidator(
                                    errorText: 'enter a valid email address')
                              ]).call,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (eml) {
                                profile.email = eml!;
                              },
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Birth Date",
                                  hintText: "DD/MM/YYYY",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.date_range,
                                  ),
                                  prefixIconColor: Colors.deepPurple),
                              validator: MultiValidator([
                                DateValidator('dd/mm/yyyy',
                                    errorText: 'enter a valid date'),
                                RequiredValidator(
                                    errorText: 'this field is required')
                              ]).call,
                              onSaved: (birt) {
                                profile.birtdate = birt!;
                              },
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Password",
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                  ),
                                  prefixIconColor: Colors.deepPurple),
                              validator: RequiredValidator(
                                      errorText: 'this field is required')
                                  .call,
                              obscureText: true,
                              onChanged: (psw) {
                                profile.password = psw;
                              },
                              style: const TextStyle(fontSize: 15),
                            ),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: "Confirm Password",
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(
                                  Icons.lock_clock_outlined,
                                ),
                                prefixIconColor: Colors.deepPurple),
                            validator: (value) {
                              if (profile.password != value) {
                                return "Passwords don't match";
                              }
                              return null;
                            },
                            obscureText: true,
                            onSaved: (cmpsw) {
                              profile.cmp = cmpsw!;
                            },
                            style: const TextStyle(fontSize: 15),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
                            child: SizedBox(
                              height: 40,
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  if (fromkey.currentState!.validate()) {
                                    fromkey.currentState!.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password)
                                          .then((value) => {
                                                fromkey.currentState!.reset(),
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'Registered successfully.',
                                                    gravity:
                                                        ToastGravity.CENTER),
                                                // ignore: use_build_context_synchronously
                                                Navigator.pushReplacement(
                                                    context, MaterialPageRoute(
                                                        builder: (context) {
                                                  return const HomeScreen();
                                                }))
                                              });
                                    } on FirebaseAuthException catch (e) {
                                      // print(e.code);
                                      // print(e.message);
                                      Fluttertoast.showToast(
                                          msg: e.message!,
                                          gravity: ToastGravity.CENTER);
                                    }
                                  }
                                },
                                icon: const Icon(Icons.add),
                                label: const Text(
                                  'register',
                                  style: TextStyle(fontSize: 15),
                                ),
                                style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    backgroundColor:
                                        const Color.fromRGBO(103, 73, 253, 1)),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: Text("its returned"),
            ),
          );
        });
  }
}
