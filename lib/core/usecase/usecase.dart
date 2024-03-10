import '../utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();

  ResultFuture<Type> call();
}

abstract class UsecaseStreamWithoutParams<Type> {
  const UsecaseStreamWithoutParams();

  ResultStream<Type> call();
}

abstract class UsecaseStreamWithParams<Type, Params> {
  const UsecaseStreamWithParams();

  ResultStream<Type> call(Params params);
}
