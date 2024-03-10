import 'dart:convert';

import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required String id,
    required String name,
    required String createAt,
    required String avatar,
  }) : super(
          id: id,
          name: name,
          createAt: createAt,
          avatar: avatar,
        );

  const UserModel.empty()
      : this(
          id: "_empty.id",
          name: "_empty.name",
          createAt: "_empty.createdAt",
          avatar: "_empty.avatar",
        );

  // change model
  UserModel copyWith({
    String? id,
    String? name,
    String? createAt,
    String? avatar,
  }) {
    return UserModel(
      avatar: avatar ?? this.avatar,
      createAt: createAt ?? this.createAt,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap json)
      : this(
          id: json['id'] as String,
          name: json['name'] as String,
          createAt: json['createdAt'] as String,
          avatar: json['avatar'] as String,
        );

  DataMap toMap() {
    return {
      'id': id,
      'createdAt': createAt,
      'name': name,
      'avatar': avatar,
    };
  }

  String toJson() => jsonEncode(toMap());
}
