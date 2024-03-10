import 'package:equatable/equatable.dart';
import 'package:tomorrow_weather/core/usecase/usecase.dart';
import 'package:tomorrow_weather/core/utils/typedef.dart';
import 'package:tomorrow_weather/src/authentication/domain/repositories/authentication_repository.dart';

class CreateUser extends UsecaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        createdAt: params.createAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  final String createAt;
  final String name;
  final String avatar;

  const CreateUserParams({
    required this.createAt,
    required this.name,
    required this.avatar,
  });

  const CreateUserParams.empty()
      : this(
          createAt: "_empty.createAt",
          name: "_empty.name",
          avatar: "_empty.avatar",
        );

  @override
  List<Object?> get props => [createAt, name, avatar];
}
