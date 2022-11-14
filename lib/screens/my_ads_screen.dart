import 'package:classified_app/custom_widgets/my_product.dart';
import 'package:flutter/material.dart';
import 'package:classified_app/data/products_info.dart';

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
        body: Center(
          child: SizedBox(
            width: 500,
            height: 800,
            child: ListView.builder(
                itemCount: adsInfo.userList().length,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, "/editad", arguments: {
                        "product": adsInfo.userList()[index],
                      });
                    },
                    child: myProduct(
                        image: adsInfo.userList()[index]["images"][0],
                        title: adsInfo.userList()[index]["title"],
                        days: adsInfo.userList()[index]["time"],
                        price: adsInfo.userList()[index]["price"]),
                  );
                })),
          ),
        ));
  }
}
