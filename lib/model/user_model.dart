class UserModel {
  final String uid, name, email, image;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.image,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map)
      : uid = map['uid'],
        email = map['email'],
        name = map['name'],
        image = map['image'];

  toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'image': image,
    };
  }
}
