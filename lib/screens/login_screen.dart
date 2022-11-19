import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:classified_app/custom_widgets/welcome_widget.dart';
import 'package:classified_app/models/user.dart';
import 'package:classified_app/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  int _isLoading = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      '',
    ),
    const CircularProgressIndicator(),
  ];

  TextEditingController _emailCtrl =
      TextEditingController(text: "daniel.bacab@itksquare.edu.mx");

  TextEditingController _passwordCtrl =
      TextEditingController(text: "bestpasswordever");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Column(
              children: [
          const Welcome(),
          SizedBox(
            width: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Email Address",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _passwordCtrl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
        
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  //login button
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = 1;
                      });
        
                      UserModel user = UserModel(
                        email: _emailCtrl.text,
                        password: _passwordCtrl.text,
                      );
        
                      Future.delayed(const Duration(milliseconds: 500), () {
                        AuthService().login(context, user);
                          setState(() {
                            setState(() {
                                              _isLoading = 0;
                                            });
                          });
                        });
        
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.only(
                              top: 10, bottom: 10, right: 30, left: 30)),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                //Don't have any account button
                SizedBox(
                  width: double.infinity,
                  height: 70,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/register");
                      },
                      child: const Text("Don't have any account?",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Color(0xfff25723),
                          ))),
                ),
        
                _widgetOptions.elementAt(_isLoading),
              ],
            ),
          ),
              ],
            )),
        ));
  }
}
