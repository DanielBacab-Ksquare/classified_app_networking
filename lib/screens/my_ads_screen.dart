import 'package:classified_app/custom_widgets/my_product.dart';
import 'package:flutter/material.dart';
import 'package:classified_app/data/products_info.dart';
import 'package:classified_app/models/ads.dart';
import 'package:classified_app/services/post.dart';

class MyAdsScreen extends StatelessWidget {
  MyAdsScreen({super.key});

  final adsInfo = ProductsInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Ads"),
          elevation: 0,
        ),
        body: FutureBuilder(
        future: PostService().fetchMyAdData(),
        builder: ((context, snapshot) {
          //print(snapshot);
          if (snapshot.hasData) {
            List<Ad> ads = snapshot.data!;

            return Center(
          child: SizedBox(
            width: 500,
            height: 800,
            child: ListView.builder(
                itemCount: ads.length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/editad", arguments: {
                        "product": ads[index],
                      });
                    },
                    child: myProduct(
                        image: ads[index].images![0],
                        title: ads[index].title!,
                        days: ads[index].createdAt!,
                        price: ads[index].price!),
                  );
                })),
          ),
        )





;
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
