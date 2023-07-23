import 'dart:convert';

class User {
  final int id;
  final String email;
  final String name;
  final String website;
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.website,
  });

  User copyWith({
    int? id,
    String? email,
    String? name,
    String? website,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      website: website ?? this.website,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'name': name,
      'website': website,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
      website: map['website'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name, website: $website)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.email == email &&
        other.name == name &&
        other.website == website;
  }

  @override
  int get hashCode {
    return id.hashCode ^ email.hashCode ^ name.hashCode ^ website.hashCode;
  }
}
