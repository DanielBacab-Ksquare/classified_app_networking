import 'package:flutter/material.dart';
import 'package:classified_app/services/post.dart';
import 'package:classified_app/models/user.dart';
import 'package:classified_app/services/patch.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class EditProfileScreen extends StatefulWidget {
  EditProfileScreen({
    super.key,
  });

  @override
  State<EditProfileScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditProfileScreen> {
  int _isLoading = 0;
  bool firstConditions = true;

  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Wait for your image to load before entering other data',
    ),
    const CircularProgressIndicator(),
  ];

  String _imagePath = '';
  String _imageServerPath = '';
  String? profilePic =
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

  bool firstPic = true;

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
        body: SingleChildScrollView(
          child: Center(
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
                  

                  if (firstPic) {
                    profilePic = user["imgURL"];
                  }

                  _upload(filePath) async {
                    var url = Uri.parse(
                        "https://adlisting.herokuapp.com/upload/profile");
                    var request = http.MultipartRequest('POST', url);
                    MultipartFile image =
                        await http.MultipartFile.fromPath('avatar', filePath);
                    request.files.add(image);
                    var response = await request.send();
                    var resp = await response.stream.bytesToString();
                    var respJson = jsonDecode(resp);
                    setState(() {
                      _imageServerPath = respJson['data']['path'];
                      print("se sube: $_imageServerPath");
                      firstPic = false;
                      profilePic = _imageServerPath;
                      //print("esto hay: $localImages2");
                    });
                  }

                  void captureImageFromGallery() async {
                    var file = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (file != null) {
                      setState(() {
                        _imagePath = file.path;
                        firstConditions = false;
                      });
                      _upload(file.path);
                    }
                  }

                  return Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      //avatar
                      GestureDetector(
                        onTap: () {
                          //change profile pic
                          captureImageFromGallery();
                          print("profilepic: $profilePic");
                        },
                        child: CircleAvatar(
                          maxRadius: 45,
                          backgroundImage: NetworkImage(profilePic ??
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                        ),
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
                                  setState(() {
                                    _isLoading = 1;
                                  });

                                  UserModel user = UserModel(
                                    name: _nameCtrl.text,
                                    email: _emailCtrl.text,
                                    mobile: _mobileCtrl.text,
                                    imgURL: profilePic,
                                  );

                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    PatchService().updateProfile(context, user);
                                    setState(() {
                                      setState(() {
                                        _isLoading = 0;
                                      });
                                    });
                                  });
                                },
                                style: ButtonStyle(
                                  padding:
                                      MaterialStateProperty.all<EdgeInsets>(
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
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
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
                            ),
                            _widgetOptions.elementAt(_isLoading),
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
          ),
        ));
  }
}
