import 'package:classified_app/custom_widgets/product.dart';
import 'package:classified_app/models/ads.dart';

import 'package:flutter/material.dart';
import 'package:classified_app/data/products_info.dart';

import 'package:classified_app/services/ads.dart';
import 'package:classified_app/services/post.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final adsInfo = ProductsInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ads Listing"),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          //To the settings screen
          GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
              child: FutureBuilder(
                future: PostService().fetchMyUser(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    Map user = snapshot.data!;
                    
                    return CircleAvatar(
                        maxRadius: 25,
                        backgroundImage: NetworkImage(user["imgURL"]??"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png")
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
              )),
        ],
      ),
      /* IconButton(
            onPressed: () {
              //_fetchUserData();
              GetAllAds().fetchAdData();
            },
            icon: Icon(Icons.refresh),
          ) */

      body: FutureBuilder(
        future: GetAllAds().fetchAdData(),
        builder: ((context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            List<Ad> ads = snapshot.data!;

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                ),
                itemCount: ads.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/productdetail",
                            arguments: {
                              "product": ads[index],
                            });
                      },
                      child: Product(
                          //image: "images/merida.jpg",
                          image: ads[index].images![0],
                          title: ads[index].title!,
                          price: ads[index].price!));
                });
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
    );
  }
}
