import 'dart:convert';

class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final String address;
  const User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.address,
  });

  User copyWith({
    int? id,
    String? username,
    String? name,
    String? email,
    String? address,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'name': name,
      'email': email,
      'address': address,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    String myid = map['id'] ?? '0';
    return User(
      id: int.parse(myid),
      username: map['username'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, username: $username, name: $name, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.username == username &&
        other.name == name &&
        other.email == email &&
        other.address == address;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        username.hashCode ^
        name.hashCode ^
        email.hashCode ^
        address.hashCode;
  }
}
