import 'dart:ffi';

import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  String image;
  String title;
  double price;

  Product({
    super.key,
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 700,
        width: 350,
        margin: const EdgeInsets.all(10),
        color: Colors.yellow,
        child: Stack(
          children: [
            SizedBox(
              height: 700,
              width: 350,
              child: 
              Image.network(
              image,
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(
                    'https://whetstonefire.org/wp-content/uploads/2020/06/image-not-available.jpg',
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,);}),
            ),
             Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                width: double.infinity,
                color: Colors.black.withOpacity(0.5),
                padding:
                    const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                    Text(
                      "\$$price",
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xfff6ac59)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
