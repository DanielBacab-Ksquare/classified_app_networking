class Ad {
  String? sId;
  String? title;
  String? description;
  num? price;
  List<String>? images;
  String? authorName;
  String? userId;
  String? mobile;
  String? createdAt;
  //int? iV;

  Ad({
    this.sId,
    this.title,
    this.description,
    this.price,
    this.images,
    this.authorName,
    this.userId,
    this.mobile,
    this.createdAt,
    //this.iV
  });

  Ad.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? '000';
    title = json['title'] ?? 'title';
    description = json['description'] ?? 'description';
    price = json['price']??0.0;
    images = List<String>.from(json['images'] ??
        [
          'https://image.shutterstock.com/image-vector/no-preview-image-icon-260nw-1295324875.jpg',
        ]);

    authorName = json['authorName'] ?? 'user';
    userId = json['userId'] ?? 'user';
    mobile = json['mobile'] ?? 'mobile';
    createdAt = json['createdAt'] ?? 'createat';
    //iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['images'] = this.images;
    data['authorName'] = this.authorName;
    data['userId'] = this.userId;
    data['mobile'] = this.mobile;
    data['createdAt'] = this.createdAt;
    //data['__v'] = this.iV;
    return data;
  }
}
