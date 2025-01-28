import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failures.dart';

// Parameters have to be put into a container object
abstract class Params extends Equatable {
  const Params();

  @override
  List<Object> get props => [];
}

// Special class for use cases that don't accept any parameters
class NoParams extends Params {
  @override
  List<Object> get props => [];
}

// Abstract class for use case
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
