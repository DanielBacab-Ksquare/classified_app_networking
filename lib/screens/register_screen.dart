import 'package:flutter/material.dart';
import 'package:classified_app/custom_widgets/welcome_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterScreen> {
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
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Full Name",
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
                    labelText: "Mobile Number",
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
                height: 60,
                width: double.infinity,
                //login button
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "/");
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
                    "Register Now",
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              //Don't have any account button
              SizedBox(
                width: double.infinity,
                height: 40,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text("Already have an account?",
                        style: TextStyle(
                          fontSize: 20,
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
