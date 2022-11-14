import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageViewerScreen extends StatefulWidget {
  dynamic images;

  ImageViewerScreen({super.key, required this.images});

  @override
  State<ImageViewerScreen> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.clear_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: CarouselSlider.builder(
        options: CarouselOptions(
          height: double.infinity,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
        ),
        itemCount: widget.images["images"].length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
          color: Colors.black,
          width: double.infinity,
          height: double.infinity,
          child: Center(
              child: Image.network(
            widget.images["images"][itemIndex],
            width: 235,
            height: 200,
            errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(
                    'https://whetstonefire.org/wp-content/uploads/2020/06/image-not-available.jpg',
                    width: 235,
                    height: 200,);}
          )),
        ),
      ),
    );
  }
}
