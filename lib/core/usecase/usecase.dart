import 'package:common/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Param, Type> {
  Future<Either<Failure, Type>> call(Param param);
}
