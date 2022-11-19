import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:classified_app/services/post.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  _openURL(url) async {
    url = Uri.parse(url);
    if (await launchUrl(url)) {
      await canLaunchUrl(url);
    } else {
      print("Error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back),
             onPressed:() {
               Navigator.pushNamed(context, '/');
             },
    )     ,
          title: const Text("Settings"),
          elevation: 0,
        ),
        body: Center(
          child: SizedBox(
            width: 350,
            child: Column(children: [
              const SizedBox(height: 18),
              

              //profile
              FutureBuilder(
                future: PostService().fetchMyUser(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    Map user = snapshot.data!;
                  
                    return Row(
                      children: [
                        //profile
                        CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: NetworkImage(user["imgURL"] ??
                                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")),
                        const SizedBox(width: 18),
                        //info
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user["name"] ?? "",
                                style: const TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                user["mobile"] ?? "",
                                style: const TextStyle(
                                    fontSize: 18, color: Color(0xff898888)),
                              )
                            ],
                          ),
                        ),
                        //const SizedBox(width: 25),
                        //Edit
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/editprofile");
                            },
                            child: const Text("Edit",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xfff25723),
                                )))
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

              const SizedBox(height: 30),
              //firstRow
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "/myads");
                },
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    children: const [
                      Icon(
                          size: 40,
                          color: Color(0xff898888),
                          Icons.featured_play_list_outlined),
                      SizedBox(width: 40),
                      Text("My Ads",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),
              //secondRow
              GestureDetector(
                onTap: () {
                  _openURL('https://appmaking.com/about/');
                },
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    children: const [
                      Icon(
                          size: 40,
                          color: Color(0xff898888),
                          Icons.person_outline),
                      SizedBox(width: 40),
                      Text("About us",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),
              //thirdRow
              GestureDetector(
                onTap: () {
                  _openURL("https://appmaking.com/contact");
                },
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Row(
                    children: const [
                      Icon(
                          size: 40,
                          color: Color(0xff898888),
                          Icons.contact_phone_outlined),
                      SizedBox(width: 40),
                      Text("Contact Us",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
