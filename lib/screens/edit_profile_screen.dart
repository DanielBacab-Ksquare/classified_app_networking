import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Edit Profile",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            //avatar
            const CircleAvatar(
              maxRadius: 45,
              backgroundImage: AssetImage('images/profile_1.jpg'),
            ),

            SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  //name
                  TextFormField(
                    initialValue: "Daniel",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        labelText: "Name",
                        labelStyle: TextStyle(
                            fontSize: 30,
                            color: Color(0xffe5e5e5),
                            fontWeight: FontWeight.w600)),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  //Email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    initialValue: "daniel.bacab@itksquare.edu.mx",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontSize: 30,
                            color: Color(0xffe5e5e5),
                            fontWeight: FontWeight.w600)),
                  ),

                  const SizedBox(
                    height: 15,
                  ),

                  //Phone number
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    initialValue: "+529798765432",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        labelText: "Phone number",
                        labelStyle: TextStyle(
                            fontSize: 30,
                            color: Color(0xffe5e5e5),
                            fontWeight: FontWeight.w600)),
                  ),

                  const SizedBox(
                    height: 45,
                  ),

                  SizedBox(
                    height: 70,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.only(
                                top: 15, bottom: 15, right: 30, left: 30)),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                            const RoundedRectangleBorder()),
                      ),
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                        child: const Text("Logout",
                            style: TextStyle(
                              fontSize: 22,
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
