import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:classified_app/models/ads.dart';
import 'package:classified_app/services/post.dart';

class CreateAdScreen extends StatefulWidget {
  CreateAdScreen({
    super.key,
  });

  @override
  State<CreateAdScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CreateAdScreen> {
  int _isLoading = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const Text(
      'Wait for your images to load before entering other data',
    ),
    const CircularProgressIndicator(),
  ];

  List<String> localImages2 = [];
  String _imagePath = '';
  String _imageServerPath = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController _title = TextEditingController();

    TextEditingController? _description = TextEditingController();

    TextEditingController? _mobileCtrl = TextEditingController();

    TextEditingController? _price = TextEditingController();

    _upload(filePath) async {
      var url = Uri.parse("https://adlisting.herokuapp.com/upload/profile");
      var request = http.MultipartRequest('POST', url);
      MultipartFile image =
          await http.MultipartFile.fromPath('avatar', filePath);
      request.files.add(image);
      var response = await request.send();
      var resp = await response.stream.bytesToString();
      var respJson = jsonDecode(resp);
      setState(() {
        _imageServerPath = respJson['data']['path'];

        localImages2.add(_imageServerPath);
       
      });
    }

    void captureImageFromGallery() async {
      var file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file != null) {
        setState(() {
          _imagePath = file.path;
        });
        _upload(file.path);
      }
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Create Ad",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
        
              //add photo
              GestureDetector(
                onTap: () {
                  //Create a new image
                  captureImageFromGallery();
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: const Color(0xff898888), width: 0.5)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(size: 40, Icons.add_photo_alternate_outlined),
                        SizedBox(height: 7),
                        Text("Tap  to upload",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ]),
                ),
              ),
        
              const SizedBox(height: 15),
        
              //images
              Container(
                padding: const EdgeInsets.only(left: 15),
                height: 75,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: localImages2.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xff898888), width: 0.5)),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Image.network(localImages2[index],
                            height: 80,
                            width: 80, errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                          return Image.network(
                            'https://whetstonefire.org/wp-content/uploads/2020/06/image-not-available.jpg',
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                      );
                    })),
              ),
        
              //text forms
              SizedBox(
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    //title
                    TextField(
                      controller: _title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        labelText: "Title",
                      ),
                    ),
        
                    const SizedBox(
                      height: 15,
                    ),
                    //Price
                    TextField(
                      controller: _price,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        labelText: "Price",
                      ),
                    ),
        
                    const SizedBox(
                      height: 15,
                    ),
        
                    //Contact number
                    TextField(
                      controller: _mobileCtrl,
                      //keyboardType: TextInputType.phone,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        labelText: "Contact number",
                      ),
                    ),
        
                    const SizedBox(
                      height: 15,
                    ),
        
                    //Description
                    TextField(
                      controller: _description,
                      maxLines: 5,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        labelText: "Description",
                        alignLabelWithHint: true,
                      ),
                    ),
        
                    const SizedBox(
                      height: 30,
                    ),
                    //Submit Ad button
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          //Here goes the update of the product
                           setState(() {
                        _isLoading = 1;
                             });
        
                          Ad ad = Ad(
                              title: _title.text,
                              description: _description.text,
                              price: double.tryParse(_price.text),
                              mobile: _mobileCtrl.text,
                              images: localImages2,
                              );
        
                              
                                  Future.delayed(const Duration(milliseconds: 500), () {
                                 PostService().createAd(context, ad); 
                                    setState(() {
                                      setState(() {
                                              _isLoading = 0;
                                            });
                          });
                        });
                         
                          
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
                          "Submit Ad",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                     const SizedBox(height: 15,),
                    _widgetOptions.elementAt(_isLoading),
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
