import 'package:flutter/material.dart';
import 'package:classified_app/custom_widgets/welcome_widget.dart';
import 'package:classified_app/models/user.dart';
import 'package:classified_app/services/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<RegisterScreen> {
  TextEditingController _nameCtrl = TextEditingController();
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _mobileCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();

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
              TextField(
                controller: _nameCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Full Name",
                    ),
              ),
              const SizedBox(
                height: 10,
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
                controller: _mobileCtrl,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0))),
                    labelText: "Mobile Number",
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
                    UserModel user = UserModel(
                      name: _nameCtrl.text,
                      email: _emailCtrl.text,
                      password: _passwordCtrl.text,
                      mobile: _mobileCtrl.text,
                    );
                    AuthService().register(context, user);
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                          fontSize: 16,
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
