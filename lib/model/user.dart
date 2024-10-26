class User {
  final String name;
  final String lastMessage;
  final String imageUrl;

  User({required this.name, required this.lastMessage, required this.imageUrl});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      lastMessage: json['lastMessage'],
      imageUrl: json['imageUrl'],
    );
  }
}
