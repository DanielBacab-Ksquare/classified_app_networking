import 'package:flutter/material.dart';

class myProduct extends StatelessWidget {
  String image;
  String title;
  int days;
  double price;

  myProduct({
    super.key,
    required this.image,
    required this.title,
    required this.days,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 400,
        margin: const EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(border: Border.all(color: const Color(0xff898888))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(image, width: 80, height: 80, fit: BoxFit.fill),
            const SizedBox(width: 10),
            //info
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.left),
                //Here goes the time ago
                Row(
                  children: [
                    const Icon(
                        size: 10, color: Color(0xff898888), Icons.access_time),
                    Text(" $days days ago",
                        style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff898888)),
                        textAlign: TextAlign.left),
                  ],
                ),
                const SizedBox(height: 7),
                //price
                Text(
                  "\$$price",
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color(0xffff8540),
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ));
  }
}
