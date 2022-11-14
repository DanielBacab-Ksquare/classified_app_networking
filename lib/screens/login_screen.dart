import 'package:flutter/material.dart';
import 'package:classified_app/custom_widgets/welcome_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Email Address",
                    labelStyle: TextStyle(
                        fontSize: 30,
                        color: Color(0xffe5e5e5),
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 10,
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 30,
                        color: Color(0xffe5e5e5),
                        fontWeight: FontWeight.w600)),
              ),
              const SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 70,
                width: double.infinity,
                //login button
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/");
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.only(
                            top: 15, bottom: 15, right: 30, left: 30)),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 30),
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
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Color(0xfff25723),
                        ))),
              )
            ],
          ),
        ),
      ],
    )));
  }
}
