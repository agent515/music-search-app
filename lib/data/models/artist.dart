class Artist {
  final String id;
  final String name;
  final String thumbnailUrl;

  Artist({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
  });

  factory Artist.fromJson(Map<String, dynamic> map) {
    String id = map['id'];
    String name = map['name'];
    String thumbnailUrl = map['thumbnailUrl'];

    return Artist(
      id: id,
      name: name,
      thumbnailUrl: thumbnailUrl,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {};
    map['id'] = id;
    map['name'] = name;
    map['thumbnailUrl'] = thumbnailUrl;
    return map;
  }

  @override
  String toString() {
    return name;
  }
}
