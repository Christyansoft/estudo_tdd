
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:estudo_tdd/core/error/failures.dart';

abstract class UseCase<Entity, Params> {

  Future<Either<Failure, Entity>> call(Params params);

}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];

}