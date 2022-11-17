import 'package:flutter/material.dart';
import 'package:classified_app/services/post.dart';
import 'package:classified_app/models/user.dart';
import 'package:classified_app/services/patch.dart';

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({
    super.key,
  });

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
          child: FutureBuilder(
            future: PostService().fetchMyUser(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                Map user = snapshot.data!;
                TextEditingController _nameCtrl =
                    TextEditingController(text: user["name"]);
                TextEditingController? _emailCtrl =
                    TextEditingController(text: user["email"]);
                TextEditingController? _mobileCtrl =
                    TextEditingController(text: user["mobile"]);
                String? profilePic = user["imgURL"];

                return Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    //avatar
                    CircleAvatar(
                      maxRadius: 45,
                      backgroundImage: NetworkImage(profilePic ??
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
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
                          TextField(
                            controller: _nameCtrl,
                            //initialValue: user["name"],

                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0))),
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
                          TextField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0))),
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
                          TextField(
                            controller: _mobileCtrl,
                            keyboardType: TextInputType.phone,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0))),
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
                                //here goes the update
                                UserModel user = UserModel(
                                  name: _nameCtrl.text,
                                  email: _emailCtrl.text,
                                  mobile: _mobileCtrl.text,
                                  imgURL: profilePic,
                                );

                                PatchService().updateProfile(context, user);
                              },
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.only(
                                        top: 15,
                                        bottom: 15,
                                        right: 30,
                                        left: 30)),
                                elevation: MaterialStateProperty.all(0),
                                shape:
                                    MaterialStateProperty.all<OutlinedBorder>(
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
                                  Navigator.pushReplacementNamed(
                                      context, "/login");
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
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Something wrong"),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          ),
        ));
  }
}
