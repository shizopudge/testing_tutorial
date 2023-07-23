class User2 {
  final int id;
  final String name;
  final String email;

  User2({required this.id, required this.name, required this.email});

  factory User2.fromJson(Map<String, dynamic> json) {
    return User2(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'email': email});

    return result;
  }
}
