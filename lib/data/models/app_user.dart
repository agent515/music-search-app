class AppUser {
  final String uid;
  final String name;
  final String email;
  final List<String> favoriteList;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    this.favoriteList = const [],
  });

  factory AppUser.fromJson(Map<String, dynamic> map) {
    return AppUser(
      uid: map['uid'],
      name: map['name'],
      email: map['name'],
      favoriteList: map['favoriteList'].cast<String>().toList(),
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['favoriteList'] = favoriteList;

    return data;
  }
}
