class UserModel {
  String? name;
  String? email;
  String? password;
  String? mobile;
  String? imgURL;

  UserModel({this.name, this.email, this.password, this.mobile, this.imgURL});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    password = json['password'] ?? '';
    mobile = json['mobile'] ?? '';
    imgURL = json["imgURL"] ??
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['imgURL'] = this.imgURL;
    return data;
  }
}
