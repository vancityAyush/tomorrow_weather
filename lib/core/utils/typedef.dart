import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = Future<Either<Failure, void>>;

typedef DataMap = Map<String, dynamic>;
typedef ResultStream<Type> = Stream<Type>;

typedef ResultStreamList<T> = ResultStream<List<T>>;
