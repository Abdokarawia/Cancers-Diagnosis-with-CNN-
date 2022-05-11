class SocialUserModel {
  String? name, email, phone, uId , bio , image , cover;
  bool? isEmailVerified ;
  SocialUserModel({this.name, this.email, this.phone, this.uId, this.isEmailVerified, this.cover , this.bio , this.image});

  SocialUserModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json["uId"];
    image = json["image"];
    cover = json["cover"];
    bio = json["bio"];
    isEmailVerified = json["isEmailVerified"];
  }

  Map <String, dynamic > toMap (){
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "uId": uId,
      "bio":bio,
      "image":image,
      "cover" : cover,
      "isEmailVerified" :isEmailVerified
    };
}

}