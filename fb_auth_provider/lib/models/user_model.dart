import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final int point;
  final String rank;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.profileImage,
      required this.point,
      required this.rank});

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>?;

    return User(
      id: userDoc.id,
      name: userData!['name'],
      email: userData['email'],
      profileImage: userData['profileImage'],
      point: userData['point'],
      rank: userData['rank'],
    );
  }

// 로그인 이전, 혹은 로그아웃 상태 일 때의 State
// User를 NonNull로 사용하기 위함
  factory User.initialUser() {
    return User(
      id: '',
      name: '',
      email: '',
      profileImage: '',
      point: -1,
      rank: '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.profileImage == profileImage &&
        other.point == point &&
        other.rank == rank;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        profileImage.hashCode ^
        point.hashCode ^
        rank.hashCode;
  }

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, profileImage: $profileImage, point: $point, rank: $rank)';
  }
}
