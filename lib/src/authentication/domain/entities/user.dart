import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String createAt;
  final String avatar;

  const User({
    required this.id,
    required this.name,
    required this.createAt,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id, name, avatar];

  const User.empty()
      : this(
          id: "_empty.id",
          name: "_empty.name",
          createAt: "_empty.createAt",
          avatar: "_empty.avatar",
        );
}
